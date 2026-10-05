import 'package:freezed_annotation/freezed_annotation.dart';

part 'cv_file.freezed.dart';

@freezed
abstract class CvExperience with _$CvExperience {
  const factory CvExperience({
    required String years,
    required String role,
    required String company,
    required String line,
  }) = _CvExperience;
}

@freezed
abstract class CvFile with _$CvFile {
  const CvFile._();

  const factory CvFile({
    required String id,
    required String name,

    /// "PDF" or "DOC", shown on the file thumbnail.
    required String ext,
    required DateTime addedAt,
    required int pages,

    /// What the reader found in the file. The lists below are the preview shown on screen.
    required int skillsCount,
    required int rolesCount,
    required int certsCount,
    required int usedIn,

    /// Whether the AI reads this file when it drafts mail or scores a posting.
    /// Unchecking keeps the file without deleting it.
    required bool inContext,
    @Default(false) bool isPrimary,
    @Default(<String>[]) List<String> skills,
    @Default(<CvExperience>[]) List<CvExperience> experience,
  }) = _CvFile;

  /// "CV_Backend_v3.pdf" -> "CV_Backend_v4.pdf". Names without a version get "_v2".
  String get nextVersionName {
    final m = RegExp(r'^(.*?)(?:_v(\d+))?(\.\w+)$').firstMatch(name);
    if (m == null) return name;
    final next = (int.tryParse(m.group(2) ?? '') ?? 1) + 1;
    return '${m.group(1)}_v$next${m.group(3)}';
  }
}
