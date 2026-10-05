import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../inbox/controller/applications_controller.dart';
import '../../inbox/models/application.dart';
import '../data/posting_repository.dart';
import '../models/parsed_posting.dart';

part 'add_job_controller.freezed.dart';

enum AddJobStep {
  capture('CAPTURE'),
  reading('READING'),
  confirm('CONFIRM');

  const AddJobStep(this.label);

  final String label;
}

@freezed
abstract class AddJobState with _$AddJobState {
  const factory AddJobState({
    @Default(AddJobStep.capture) AddJobStep step,
    @Default('') String text,
    ParsedPosting? posting,

    /// Index into [ParsedPosting.cvMatches].
    @Default(0) int cvChoice,
  }) = _AddJobState;
}

/// Capture, reading (shimmer), confirm. Ends by creating a draft application.
class AddJobController extends Notifier<AddJobState> {
  /// Set once the draft exists, so "Generate" and "See match" don't create two.
  String? _draftId;

  @override
  AddJobState build() => const AddJobState();

  void setText(String text) => state = state.copyWith(text: text);

  void selectCv(int index) => state = state.copyWith(cvChoice: index);

  Future<void> read() async {
    _draftId = null;
    state = state.copyWith(step: AddJobStep.reading);
    final posting = await ref.read(postingRepositoryProvider).read(text: state.text);
    if (!ref.mounted) return;
    state = state.copyWith(step: AddJobStep.confirm, posting: posting, cvChoice: 0);
  }

  /// Saves the confirmed posting as a draft and returns its id.
  Future<String?> generate() async {
    if (_draftId != null) return _draftId;
    final posting = state.posting;
    if (posting == null) return null;
    final cv = posting.cvMatches[state.cvChoice];
    final application = Application(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      company: posting.company,
      role: posting.role,
      location: posting.location,
      level: posting.level,
      cvName: cv.cvFileName.replaceFirst(RegExp(r'\.\w+$'), ''),
      status: AppStatus.draft,
      unread: true,
      score: cv.score,
      date: DateTime.now(),
      snippet: 'Draft ready. Bracketed wording pulled from the posting screenshot. Review before sending.',
    );
    await ref.read(applicationsControllerProvider.notifier).addDraft(application);
    return _draftId = application.id;
  }
}

final addJobControllerProvider =
    NotifierProvider.autoDispose<AddJobController, AddJobState>(AddJobController.new);
