import 'package:careermate/features/cv_bank/models/cv_file.dart';
import 'package:flutter_test/flutter_test.dart';

CvFile _cv(String name) => CvFile(
  id: '1',
  name: name,
  ext: 'PDF',
  addedAt: DateTime(2026, 9, 2),
  pages: 2,
  skillsCount: 0,
  rolesCount: 0,
  certsCount: 0,
  usedIn: 0,
  inContext: true,
);

void main() {
  test('nextVersionName bumps the version before the extension', () {
    expect(_cv('CV_Backend_v3.pdf').nextVersionName, 'CV_Backend_v4.pdf');
    expect(_cv('CV_Platform_v9.pdf').nextVersionName, 'CV_Platform_v10.pdf');
  });

  test('nextVersionName adds _v2 when there is no version yet', () {
    expect(_cv('Karim_Resume_2024.docx').nextVersionName, 'Karim_Resume_2024_v2.docx');
  });
}
