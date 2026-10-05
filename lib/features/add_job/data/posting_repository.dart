import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/parsed_posting.dart';

/// OCR and matching run on the backend. Screenshots are uploaded compressed
/// (max ~1600px long side).
abstract class PostingRepository {
  Future<ParsedPosting> read({String? text});
}

final postingRepositoryProvider = Provider<PostingRepository>((ref) => MockPostingRepository());

class MockPostingRepository implements PostingRepository {
  @override
  Future<ParsedPosting> read({String? text}) async {
    await Future<void>.delayed(const Duration(milliseconds: 1700));
    return const ParsedPosting(
      company: 'Xendit',
      role: 'Senior Backend Engineer',
      location: 'Jakarta · Hybrid',
      level: 'Senior',
      deadline: '24 Sep 2026',
      confidence: 94,
      requirements: [
        PostingRequirement(label: 'Go', core: true),
        PostingRequirement(label: 'PostgreSQL', core: true),
        PostingRequirement(label: 'Kafka', core: true),
        PostingRequirement(label: 'gRPC'),
        PostingRequirement(label: '5+ yrs'),
        PostingRequirement(label: 'Payments domain'),
      ],
      cvMatches: [
        CvMatch(cvFileName: 'CV_Backend_v3.pdf', score: 91),
        CvMatch(cvFileName: 'CV_Platform_v1.pdf', score: 74),
      ],
    );
  }
}
