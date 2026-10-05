import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../compose/data/mail_templates.dart';
import '../models/application.dart';

/// Hides where applications come from (API, local cache). One repository per domain.
abstract class ApplicationRepository {
  Future<List<Application>> fetchAll();

  /// Inserts or replaces by id. New applications go to the top.
  Future<void> save(Application application);
}

final applicationRepositoryProvider = Provider<ApplicationRepository>(
  (ref) => MockApplicationRepository(),
);

/// In-memory data from the prototype, so the UI can be built before the backend exists.
class MockApplicationRepository implements ApplicationRepository {
  MockApplicationRepository() : _items = _seed();

  final List<Application> _items;

  @override
  Future<List<Application>> fetchAll() async => List.unmodifiable(_items);

  @override
  Future<void> save(Application application) async {
    final i = _items.indexWhere((a) => a.id == application.id);
    if (i >= 0) {
      _items[i] = application;
    } else {
      _items.insert(0, application);
    }
  }

  static Application _sent({
    required String id,
    required String company,
    required String role,
    required String cvName,
    required AppStatus status,
    required bool unread,
    required int score,
    required DateTime date,
    required String snippet,
    required String location,
    required String level,
    DateTime? sentAt,
  }) => Application(
    id: id,
    company: company,
    role: role,
    cvName: cvName,
    status: status,
    unread: unread,
    score: score,
    date: date,
    snippet: snippet,
    location: location,
    level: level,
    sentAt: sentAt ?? date,
    sentMail: sentMailBody(company: company, role: role, cvName: cvName),
  );

  static List<Application> _seed() => [
    _sent(
      id: '1',
      company: 'Tokopedia',
      role: 'Senior Backend Engineer',
      cvName: 'CV_Backend_v3',
      snippet:
          'Dear Hiring Team, I am applying for the Senior Backend Engineer role. Over the last five years…',
      date: DateTime(2026, 9, 14),
      score: 88,
      status: AppStatus.sent,
      unread: false,
      location: 'Jakarta · Hybrid',
      level: 'Senior',
    ),
    Application(
      id: '2',
      company: 'Gojek',
      role: 'Platform Engineer',
      cvName: 'CV_Platform_v1',
      snippet: 'Draft ready. Bracketed wording pulled from the posting screenshot. Review before sending.',
      date: DateTime(2026, 9, 13),
      score: 74,
      status: AppStatus.draft,
      unread: true,
      location: 'Jakarta · Onsite',
      level: 'Mid–Senior',
    ),
    _sent(
      id: '3',
      company: 'Xendit',
      role: 'Senior Backend Engineer',
      cvName: 'CV_Backend_v3',
      snippet: 'Sent 11 Sep. You marked this as replied. Follow-up mail not written yet.',
      date: DateTime(2026, 9, 11),
      sentAt: DateTime(2026, 9, 9, 10, 14),
      score: 91,
      status: AppStatus.replied,
      unread: true,
      location: 'Jakarta · Hybrid',
      level: 'Senior',
    ),
    _sent(
      id: '4',
      company: 'Traveloka',
      role: 'Backend Engineer',
      cvName: 'CV_Backend_v2',
      snippet: 'Sent 12 days ago. No reply yet. Follow up or archive?',
      date: DateTime(2026, 9, 4),
      score: 66,
      status: AppStatus.noResponse,
      unread: false,
      location: 'Tangerang',
      level: 'Mid',
    ),
    _sent(
      id: '5',
      company: 'eFishery',
      role: 'Data Platform Engineer',
      cvName: 'CV_Backend_v3',
      snippet:
          'Dear Recruitment Team, I am writing about the Data Platform Engineer opening in Bandung…',
      date: DateTime(2026, 9, 2),
      score: 79,
      status: AppStatus.sent,
      unread: false,
      location: 'Bandung · Remote',
      level: 'Senior',
    ),
    Application(
      id: '6',
      company: 'Kredivo',
      role: 'Backend Engineer',
      cvName: 'CV_Backend_v3',
      snippet: 'Draft ready. Deadline on the posting is 20 Sep, six days left.',
      date: DateTime(2026, 8, 28),
      score: 83,
      status: AppStatus.draft,
      unread: true,
      location: 'Jakarta',
      level: 'Mid–Senior',
    ),
    _sent(
      id: '7',
      company: 'Bukalapak',
      role: 'Site Reliability Engineer',
      cvName: 'CV_Platform_v1',
      snippet: 'Sent 24 Aug. Marked as replied on 27 Aug.',
      date: DateTime(2026, 8, 24),
      score: 71,
      status: AppStatus.replied,
      unread: false,
      location: 'Jakarta · Remote',
      level: 'Senior',
    ),
    // The prototype's drawer shows 3 archived. These stand in for them.
    _sent(
      id: '8',
      company: 'Shopee',
      role: 'Backend Engineer',
      cvName: 'CV_Backend_v2',
      snippet: 'Archived after no reply.',
      date: DateTime(2026, 8, 20),
      score: 69,
      status: AppStatus.archived,
      unread: false,
      location: 'Jakarta · Hybrid',
      level: 'Mid',
    ),
    _sent(
      id: '9',
      company: 'Blibli',
      role: 'Platform Engineer',
      cvName: 'CV_Platform_v1',
      snippet: 'Archived after no reply.',
      date: DateTime(2026, 8, 12),
      score: 72,
      status: AppStatus.archived,
      unread: false,
      location: 'Jakarta',
      level: 'Mid–Senior',
    ),
    _sent(
      id: '10',
      company: 'Ruangguru',
      role: 'Senior Backend Engineer',
      cvName: 'CV_Backend_v2',
      snippet: 'Archived after no reply.',
      date: DateTime(2026, 8, 3),
      score: 64,
      status: AppStatus.archived,
      unread: false,
      location: 'Remote',
      level: 'Senior',
    ),
  ];
}
