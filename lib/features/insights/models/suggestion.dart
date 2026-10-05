import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestion.freezed.dart';

enum SuggestionTag {
  gap('GAP'),
  keyword('KEYWORD'),
  evidence('EVIDENCE'),
  trim('TRIM');

  const SuggestionTag(this.label);

  final String label;
}

enum SuggestionStatus { open, approved, skipped }

@freezed
abstract class Suggestion with _$Suggestion {
  const factory Suggestion({
    required String id,
    required SuggestionTag tag,

    /// Where in the CV the line lives, e.g. "Summary, line 1".
    required String where,

    /// Expected lift, e.g. "+4 match" or "clarity".
    required String lift,
    required String before,
    required String after,
    @Default(SuggestionStatus.open) SuggestionStatus status,
  }) = _Suggestion;
}
