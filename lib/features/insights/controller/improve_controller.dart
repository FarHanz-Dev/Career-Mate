import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/match_repository.dart';
import '../models/suggestion.dart';

/// Suggested edits for one CV. Nothing is written to the CV until approved;
/// approving rewrites only the line shown.
class ImproveController extends AsyncNotifier<List<Suggestion>> {
  ImproveController(this.cvId);

  final String cvId;

  @override
  Future<List<Suggestion>> build() => ref.watch(matchRepositoryProvider).suggestionsFor(cvId);

  void _set(String id, SuggestionStatus status) {
    final list = state.value;
    if (list == null) return;
    state = AsyncData([for (final s in list) s.id == id ? s.copyWith(status: status) : s]);
  }

  void approve(String id) => _set(id, SuggestionStatus.approved);
  void skip(String id) => _set(id, SuggestionStatus.skipped);
}

final improveControllerProvider =
    AsyncNotifierProvider.autoDispose.family<ImproveController, List<Suggestion>, String>(
      ImproveController.new,
    );
