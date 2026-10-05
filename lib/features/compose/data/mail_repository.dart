import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../inbox/models/application.dart';
import '../../profile/models/career_profile.dart';
import '../models/mail_draft.dart';
import 'mail_templates.dart';

/// Drafting runs on the backend. Sending goes through the user's Gmail
/// (`gmail.send` scope); the app never reads incoming mail.
abstract class MailRepository {
  Future<MailDraft> generateDraft({
    Application? application,
    required CareerProfile profile,
    required String cvFileName,
  });

  Future<void> send({
    required String to,
    required String subject,
    required String body,
    required String cvFileName,
  });
}

final mailRepositoryProvider = Provider<MailRepository>((ref) => MockMailRepository());

class MockMailRepository implements MailRepository {
  @override
  Future<MailDraft> generateDraft({
    Application? application,
    required CareerProfile profile,
    required String cvFileName,
  }) async {
    final app = application;
    return MailDraft(
      to: app == null ? '' : 'careers@${app.company.toLowerCase().replaceAll(RegExp('[^a-z0-9]'), '')}.co',
      subject: app == null ? '' : '${app.role}, ${profile.name}',
      body: draftMailBody(
        company: app?.company ?? 'company',
        role: app?.role ?? 'role',
        cvFileName: cvFileName,
        location: (app?.location ?? profile.location.label).split(' · ').first,
        name: profile.name,
      ),
    );
  }

  @override
  Future<void> send({
    required String to,
    required String subject,
    required String body,
    required String cvFileName,
  }) async {}
}
