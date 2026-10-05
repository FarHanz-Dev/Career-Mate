import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app/toast/toast_controller.dart';
import '../../../core/utils/date_format.dart';
import '../models/application.dart';
import '../models/inbox_label.dart';
import 'applications_controller.dart';

part 'inbox_controller.freezed.dart';

@freezed
abstract class InboxState with _$InboxState {
  const InboxState._();

  const factory InboxState({
    @Default(InboxLabel.all) InboxLabel label,
    @Default('') String query,
    @Default(false) bool recentOnly,
    @Default(<String>{}) Set<String> selectedIds,
  }) = _InboxState;

  bool get selectMode => selectedIds.isNotEmpty;
}

/// UI state and intents for the inbox: label, search, multi-select, row actions.
class InboxController extends Notifier<InboxState> {
  Timer? _debounce;

  @override
  InboxState build() {
    ref.onDispose(() => _debounce?.cancel());
    return const InboxState();
  }

  ApplicationsController get _applications => ref.read(applicationsControllerProvider.notifier);
  ToastController get _toast => ref.read(toastProvider.notifier);

  void setLabel(InboxLabel label) => state = state.copyWith(label: label, selectedIds: const {});

  void toggleRecent() => state = state.copyWith(recentOnly: !state.recentOnly);

  /// Debounced by 250ms; the list filters on the cached applications.
  void setQuery(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 250), () {
      state = state.copyWith(query: query);
    });
  }

  void toggleSelect(String id) {
    final next = {...state.selectedIds};
    if (!next.remove(id)) next.add(id);
    state = state.copyWith(selectedIds: next);
  }

  void clearSelection() => state = state.copyWith(selectedIds: const {});

  void open(String id) => _applications.markRead(id);

  void markReplied(String id) {
    _applications.markReplied([id]);
    _toast.show('Marked as replied');
  }

  void archive(String id) {
    _applications.archive([id]);
    _drop({id});
    _toast.show('Archived. Undo?');
  }

  void archiveSelected() {
    final ids = state.selectedIds;
    _applications.archive(ids);
    _toast.show('Archived ${plural(ids.length, 'application')}');
    clearSelection();
  }

  void markSelectedReplied() {
    _applications.markReplied(state.selectedIds);
    _toast.show('Marked as replied');
    clearSelection();
  }

  void _drop(Set<String> ids) {
    if (state.selectedIds.any(ids.contains)) {
      state = state.copyWith(selectedIds: state.selectedIds.difference(ids));
    }
  }
}

final inboxControllerProvider = NotifierProvider<InboxController, InboxState>(InboxController.new);

/// Label, search and "last 30 days" applied to the cached list.
List<Application> filterApplications(
  List<Application> all, {
  required InboxLabel label,
  String query = '',
  bool recentOnly = false,
  DateTime? now,
}) {
  final q = query.trim().toLowerCase();
  final cutoff = (now ?? DateTime.now()).subtract(const Duration(days: 30));
  return [
    for (final a in all)
      if (label.matches(a.status) &&
          (!recentOnly || a.date.isAfter(cutoff)) &&
          (q.isEmpty || '${a.company} ${a.role} ${a.cvName}'.toLowerCase().contains(q)))
        a,
  ];
}

final visibleApplicationsProvider = Provider<AsyncValue<List<Application>>>((ref) {
  final all = ref.watch(applicationsControllerProvider);
  final label = ref.watch(inboxControllerProvider.select((s) => s.label));
  final query = ref.watch(inboxControllerProvider.select((s) => s.query));
  final recent = ref.watch(inboxControllerProvider.select((s) => s.recentOnly));
  return all.whenData((list) => filterApplications(list, label: label, query: query, recentOnly: recent));
});

/// Counts shown next to each label in the drawer.
final labelCountsProvider = Provider<Map<InboxLabel, int>>((ref) {
  final all = ref.watch(applicationsControllerProvider).value ?? const <Application>[];
  return {
    for (final l in InboxLabel.values) l: all.where((a) => l.matches(a.status)).length,
  };
});
