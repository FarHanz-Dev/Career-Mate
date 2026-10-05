import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/toast/toast_controller.dart';
import '../data/application_repository.dart';
import '../models/application.dart';

/// Source of truth for the applications list. Edits are optimistic: the state
/// changes first, then the repository is called; a failure rolls the state back.
class ApplicationsController extends AsyncNotifier<List<Application>> {
  @override
  Future<List<Application>> build() => ref.watch(applicationRepositoryProvider).fetchAll();

  Future<void> _apply(Iterable<String> ids, Application Function(Application) edit) async {
    final before = state.value;
    if (before == null) return;
    final target = ids.toSet();
    final after = [for (final a in before) target.contains(a.id) ? edit(a) : a];
    state = AsyncData(after);
    try {
      final repo = ref.read(applicationRepositoryProvider);
      for (final a in after.where((a) => target.contains(a.id))) {
        await repo.save(a);
      }
    } catch (_) {
      if (!ref.mounted) return;
      state = AsyncData(before);
      ref.read(toastProvider.notifier).show('Could not save the change. Try again.');
    }
  }

  Future<void> markRead(String id) => _apply([id], (a) => a.copyWith(unread: false));

  Future<void> markReplied(Iterable<String> ids) =>
      _apply(ids, (a) => a.copyWith(status: AppStatus.replied, unread: false));

  /// The thread toggle: replied, or no response yet.
  Future<void> setReplyStatus(String id, AppStatus status) =>
      _apply([id], (a) => a.copyWith(status: status));

  Future<void> archive(Iterable<String> ids) =>
      _apply(ids, (a) => a.copyWith(status: AppStatus.archived));

  Future<void> markSent(String id, {required String mail}) => _apply(
    [id],
    (a) => a.copyWith(
      status: AppStatus.sent,
      sentAt: DateTime.now(),
      date: DateTime.now(),
      sentMail: mail,
      snippet: mail.replaceAll('\n', ' '),
    ),
  );

  /// A new draft from a read posting. Goes to the top of the list.
  Future<void> addDraft(Application application) async {
    final before = state.value ?? const <Application>[];
    state = AsyncData([application, ...before]);
    try {
      await ref.read(applicationRepositoryProvider).save(application);
    } catch (_) {
      if (!ref.mounted) return;
      state = AsyncData(before);
      ref.read(toastProvider.notifier).show('Could not save the draft. Try again.');
    }
  }
}

final applicationsControllerProvider =
    AsyncNotifierProvider<ApplicationsController, List<Application>>(ApplicationsController.new);

/// One application, rebuilt only when that application changes.
final applicationProvider = Provider.family<Application?, String>((ref, id) {
  return ref.watch(
    applicationsControllerProvider.select((v) => v.value?.where((a) => a.id == id).firstOrNull),
  );
});
