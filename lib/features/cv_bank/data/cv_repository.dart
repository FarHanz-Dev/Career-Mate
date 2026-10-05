import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cv_file.dart';

abstract class CvRepository {
  Future<List<CvFile>> fetchAll();

  /// Inserts or replaces by id. New files go to the top.
  Future<void> save(CvFile cv);
}

final cvRepositoryProvider = Provider<CvRepository>((ref) => MockCvRepository());

class MockCvRepository implements CvRepository {
  MockCvRepository() : _items = _seed();

  final List<CvFile> _items;

  @override
  Future<List<CvFile>> fetchAll() async => List.unmodifiable(_items);

  @override
  Future<void> save(CvFile cv) async {
    final i = _items.indexWhere((c) => c.id == cv.id);
    if (i >= 0) {
      _items[i] = cv;
    } else {
      _items.insert(0, cv);
    }
  }

  static const _skills = [
    'Go', 'PostgreSQL', 'Kafka', 'Redis', 'Docker', 'Kubernetes',
    'gRPC', 'Terraform', 'GraphQL', 'Python', 'CI/CD',
  ];

  static const _experience = [
    CvExperience(
      years: '2024 to now',
      role: 'Backend Engineer',
      company: 'Xendit',
      line: 'Transaction service in Go: exactly-once Kafka consumers, idempotent retries, 99.98% availability.',
    ),
    CvExperience(
      years: '2021 to 2024',
      role: 'Backend Engineer',
      company: 'Tokopedia',
      line: 'Ledger and reconciliation. Partitioned a 900M-row Postgres table; errors down 38%.',
    ),
    CvExperience(
      years: '2019 to 2021',
      role: 'Software Engineer',
      company: 'Sirclo',
      line: 'Order APIs for 400 merchants. Moved deploys to Kubernetes with Terraform.',
    ),
  ];

  static List<CvFile> _seed() => [
    CvFile(
      id: '1',
      name: 'CV_Backend_v3.pdf',
      ext: 'PDF',
      addedAt: DateTime(2026, 9, 2),
      pages: 2,
      skillsCount: 18,
      rolesCount: 4,
      certsCount: 2,
      usedIn: 4,
      inContext: true,
      isPrimary: true,
      skills: _skills,
      experience: _experience,
    ),
    CvFile(
      id: '2',
      name: 'CV_Platform_v1.pdf',
      ext: 'PDF',
      addedAt: DateTime(2026, 8, 18),
      pages: 2,
      skillsCount: 15,
      rolesCount: 3,
      certsCount: 2,
      usedIn: 2,
      inContext: true,
      skills: _skills,
      experience: _experience,
    ),
    CvFile(
      id: '3',
      name: 'Karim_Resume_2024.docx',
      ext: 'DOC',
      addedAt: DateTime(2025, 3, 11),
      pages: 1,
      skillsCount: 11,
      rolesCount: 2,
      certsCount: 0,
      usedIn: 0,
      inContext: false,
      skills: _skills,
      experience: _experience,
    ),
    CvFile(
      id: '4',
      name: 'Portfolio_notes.pdf',
      ext: 'PDF',
      addedAt: DateTime(2025, 2, 4),
      pages: 6,
      skillsCount: 7,
      rolesCount: 1,
      certsCount: 0,
      usedIn: 0,
      inContext: false,
      skills: _skills,
      experience: _experience,
    ),
  ];
}
