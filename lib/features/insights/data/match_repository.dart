import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../inbox/models/application.dart';
import '../models/match_result.dart';
import '../models/suggestion.dart';

abstract class MatchRepository {
  Future<MatchResult> matchFor(Application application);
  Future<List<Suggestion>> suggestionsFor(String cvId);
}

final matchRepositoryProvider = Provider<MatchRepository>((ref) => MockMatchRepository());

/// The prototype only has one breakdown (Xendit). Every application gets that
/// breakdown under its own company, role and score until the backend scores them.
class MockMatchRepository implements MatchRepository {
  @override
  Future<MatchResult> matchFor(Application application) async => MatchResult(
    applicationId: application.id,
    company: application.company,
    role: application.role,
    score: application.score,
    summary:
        'Strong on the stack they name first. The gap is payments-domain wording, not skill.',
    dimensions: const [
      Dimension(
        name: 'Core skills',
        pct: 96,
        note: 'Go, PostgreSQL, Kafka and Redis all named in the posting and all evidenced in the CV.',
      ),
      Dimension(
        name: 'Experience depth',
        pct: 88,
        note: '5 years against the 5+ they ask for, at comparable scale.',
      ),
      Dimension(
        name: 'Domain language',
        pct: 61,
        note:
            'Your CV says "transaction service"; the posting says "payments infrastructure". Same work, different words.',
      ),
      Dimension(
        name: 'Keywords in CV',
        pct: 74,
        note: 'gRPC and observability appear in the posting but not in your summary.',
      ),
    ],
    evidence: const [
      Evidence(
        need: 'Go services at scale',
        proof: '"Transaction service in Go, 8k rps behind gRPC" from CV_Backend_v3, Experience 1',
        met: true,
      ),
      Evidence(
        need: 'Event streaming with Kafka',
        proof: '"Exactly-once Kafka consumers with idempotent retries" from Experience 1',
        met: true,
      ),
      Evidence(
        need: 'PostgreSQL at volume',
        proof: '"Partitioned a 900M-row ledger table" from Experience 2',
        met: true,
      ),
      Evidence(
        need: 'Payments domain wording',
        proof: 'Not stated. The work qualifies; the CV never uses the word payments.',
        met: false,
      ),
      Evidence(
        need: 'Observability ownership',
        proof: 'Not found in the CV. Add the on-call and tracing work if it was yours.',
        met: false,
      ),
    ],
  );

  @override
  Future<List<Suggestion>> suggestionsFor(String cvId) async => const [
    Suggestion(
      id: '1',
      tag: SuggestionTag.gap,
      where: 'Summary, line 1',
      lift: '+4 match',
      before: 'Backend engineer with experience in distributed systems and cloud infrastructure.',
      after: 'Backend engineer, 5 yrs, building payment and ledger services in Go on PostgreSQL and Kafka.',
    ),
    Suggestion(
      id: '2',
      tag: SuggestionTag.keyword,
      where: 'Xendit · Experience 2',
      lift: '+3 match',
      before: 'Worked on the transaction service and improved reliability.',
      after:
          'Owned the transaction service: exactly-once Kafka consumers, idempotent retries, 99.98% monthly availability.',
    ),
    Suggestion(
      id: '3',
      tag: SuggestionTag.evidence,
      where: 'Experience 1, bullet 3',
      lift: '+2 match',
      before: 'Reduced reconciliation issues significantly.',
      after:
          'Cut reconciliation errors 38% by partitioning a 900M-row ledger and adding a nightly checksum job.',
    ),
    Suggestion(
      id: '4',
      tag: SuggestionTag.trim,
      where: 'Skills',
      lift: 'clarity',
      before: 'Skills: Go, Python, Java, PHP, Node, React, Vue, Docker, K8s, AWS, GCP, MySQL, Redis…',
      after: 'Core: Go, PostgreSQL, Kafka, Redis, Kubernetes. Also: Python, Terraform, gRPC.',
    ),
  ];
}
