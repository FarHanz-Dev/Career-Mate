import 'package:freezed_annotation/freezed_annotation.dart';

part 'parsed_posting.freezed.dart';

/// A requirement the reader picked up. [core] ones are highlighted.
@freezed
abstract class PostingRequirement with _$PostingRequirement {
  const factory PostingRequirement({required String label, @Default(false) bool core}) =
      _PostingRequirement;
}

@freezed
abstract class CvMatch with _$CvMatch {
  const factory CvMatch({required String cvFileName, required int score}) = _CvMatch;
}

/// What the reader pulled out of a screenshot or pasted text.
@freezed
abstract class ParsedPosting with _$ParsedPosting {
  const factory ParsedPosting({
    required String company,
    required String role,
    required String location,
    required String level,
    required String deadline,

    /// Reader confidence, 0 to 100.
    required int confidence,
    required List<PostingRequirement> requirements,

    /// How each CV in the bank scores against the posting, best first.
    required List<CvMatch> cvMatches,
  }) = _ParsedPosting;
}
