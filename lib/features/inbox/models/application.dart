import 'package:freezed_annotation/freezed_annotation.dart';

part 'application.freezed.dart';

/// Reply status is local bookkeeping: the user sets it by hand, CareerMate
/// never reads the mailbox.
enum AppStatus {
  draft('DRAFT'),
  sent('SENT'),
  replied('REPLIED'),
  noResponse('NO RESPONSE'),
  archived('ARCHIVED');

  const AppStatus(this.label);

  final String label;
}

@freezed
abstract class Application with _$Application {
  const factory Application({
    required String id,
    required String company,
    required String role,
    required String location,
    required String level,

    /// Display name of the CV used, as it was when the mail was drafted.
    required String cvName,
    required AppStatus status,
    required bool unread,

    /// Match score, 0 to 100.
    required int score,

    /// Last activity, shown on the row.
    required DateTime date,
    required String snippet,
    DateTime? sentAt,
    String? sentMail,
  }) = _Application;
}
