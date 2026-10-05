import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/toast/toast_controller.dart';
import '../data/cv_repository.dart';
import '../models/cv_file.dart';

/// The CV list and which files are in the AI's context.
class CvBankController extends AsyncNotifier<List<CvFile>> {
  @override
  Future<List<CvFile>> build() => ref.watch(cvRepositoryProvider).fetchAll();

  Future<void> setInContext(String id, bool value) async {
    final before = state.value;
    if (before == null) return;
    CvFile? changed;
    final after = [
      for (final c in before)
        if (c.id == id) (changed = c.copyWith(inContext: value)) else c,
    ];
    state = AsyncData(after);
    if (changed == null) return;
    try {
      await ref.read(cvRepositoryProvider).save(changed);
    } catch (_) {
      if (!ref.mounted) return;
      state = AsyncData(before);
      ref.read(toastProvider.notifier).show('Could not save the change. Try again.');
    }
  }

  /// The improved copy written after approving suggestions. The original stays untouched.
  Future<CvFile?> saveNextVersion(String baseId) async {
    final before = state.value;
    final base = before?.where((c) => c.id == baseId).firstOrNull;
    if (before == null || base == null) return null;
    final next = base.copyWith(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: base.nextVersionName,
      addedAt: DateTime.now(),
      usedIn: 0,
      inContext: true,
      isPrimary: false,
    );
    state = AsyncData([next, ...before]);
    try {
      await ref.read(cvRepositoryProvider).save(next);
    } catch (_) {
      if (!ref.mounted) return null;
      state = AsyncData(before);
      ref.read(toastProvider.notifier).show('Could not save the CV. Try again.');
      return null;
    }
    return next;
  }
}

final cvBankControllerProvider =
    AsyncNotifierProvider<CvBankController, List<CvFile>>(CvBankController.new);

class CvQueryController extends Notifier<String> {
  @override
  String build() => '';

  void set(String query) => state = query;
}

final cvQueryProvider = NotifierProvider<CvQueryController, String>(CvQueryController.new);

final visibleCvsProvider = Provider<AsyncValue<List<CvFile>>>((ref) {
  final q = ref.watch(cvQueryProvider).trim().toLowerCase();
  return ref.watch(cvBankControllerProvider).whenData(
    (list) => [for (final c in list) if (q.isEmpty || c.name.toLowerCase().contains(q)) c],
  );
});

final cvProvider = Provider.family<CvFile?, String>((ref, id) {
  return ref.watch(
    cvBankControllerProvider.select((v) => v.value?.where((c) => c.id == id).firstOrNull),
  );
});

/// The CV drafts read by default.
final primaryCvProvider = Provider<CvFile?>((ref) {
  return ref.watch(
    cvBankControllerProvider.select(
      (v) => v.value?.where((c) => c.isPrimary).firstOrNull ?? v.value?.firstOrNull,
    ),
  );
});
