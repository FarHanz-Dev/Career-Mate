import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/date_format.dart';
import '../../inbox/controller/applications_controller.dart';
import '../../inbox/models/application.dart';

enum ThreadMessageKind { draft, sent }

class ThreadMessageData {
  const ThreadMessageData({
    required this.kind,
    required this.from,
    required this.date,
    required this.body,
  });

  final ThreadMessageKind kind;
  final String from;
  final String date;
  final String body;

  String get id => kind.name;
}

/// The thread ends at the sent mail. There is no conversation UI, since
/// CareerMate never reads replies.
final threadMessagesProvider = Provider.family<List<ThreadMessageData>, String>((ref, id) {
  final app = ref.watch(applicationProvider(id));
  if (app == null) return const [];
  final sentAt = app.sentAt;
  return [
    ThreadMessageData(
      kind: ThreadMessageKind.draft,
      from: 'CareerMate AI',
      date: shortDate(sentAt ?? app.date),
      body:
          'Drafted from the posting screenshot and ${app.cvName}. Nothing leaves the phone until you tap Send.',
    ),
    if (sentAt != null && app.sentMail != null)
      ThreadMessageData(
        kind: ThreadMessageKind.sent,
        from: 'You',
        date: shortDateTime(sentAt),
        body: app.sentMail!,
      ),
  ];
});

/// Which message is expanded. Only one at a time; all collapsed by default.
class ThreadController extends Notifier<String?> {
  ThreadController(this.applicationId);

  final String applicationId;

  @override
  String? build() => null;

  void toggle(String messageId) => state = state == messageId ? null : messageId;

  /// The two-option toggle. "No response yet" and "They replied" are the only
  /// states the user can set here.
  void setReplied(bool replied) => ref
      .read(applicationsControllerProvider.notifier)
      .setReplyStatus(applicationId, replied ? AppStatus.replied : AppStatus.noResponse);
}

final threadControllerProvider =
    NotifierProvider.autoDispose.family<ThreadController, String?, String>(ThreadController.new);
