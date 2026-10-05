import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../inbox/controller/applications_controller.dart';
import '../data/match_repository.dart';
import '../models/match_result.dart';

/// Match breakdown for one application.
final matchResultProvider = FutureProvider.family<MatchResult, String>((ref, applicationId) async {
  final application = ref.watch(applicationProvider(applicationId));
  if (application == null) throw StateError('No application $applicationId');
  return ref.watch(matchRepositoryProvider).matchFor(application);
});

/// The application the Insights tab opens: the last one viewed, else the best match.
class InsightsFocusController extends Notifier<String?> {
  @override
  String? build() => null;

  void focus(String applicationId) => state = applicationId;
}

final insightsFocusProvider =
    NotifierProvider<InsightsFocusController, String?>(InsightsFocusController.new);

/// Id the Insights tab should open, or null while there are no applications.
final insightsTargetProvider = Provider<String?>((ref) {
  final focused = ref.watch(insightsFocusProvider);
  if (focused != null) return focused;
  final all = ref.watch(applicationsControllerProvider).value;
  if (all == null || all.isEmpty) return null;
  return all.reduce((a, b) => b.score > a.score ? b : a).id;
});
