import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_result.freezed.dart';

@freezed
abstract class Dimension with _$Dimension {
  const factory Dimension({required String name, required int pct, required String note}) = _Dimension;
}

/// One posting requirement and the CV quote that backs it. [met] false is a gap.
@freezed
abstract class Evidence with _$Evidence {
  const factory Evidence({required String need, required String proof, required bool met}) = _Evidence;
}

@freezed
abstract class MatchResult with _$MatchResult {
  const MatchResult._();

  const factory MatchResult({
    required String applicationId,
    required String company,
    required String role,
    required int score,
    required String summary,
    required List<Dimension> dimensions,
    required List<Evidence> evidence,
  }) = _MatchResult;

  int get gapCount => evidence.where((e) => !e.met).length;
}
