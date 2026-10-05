import 'package:freezed_annotation/freezed_annotation.dart';

part 'mail_draft.freezed.dart';

@freezed
abstract class MailDraft with _$MailDraft {
  const factory MailDraft({required String to, required String subject, required String body}) =
      _MailDraft;
}
