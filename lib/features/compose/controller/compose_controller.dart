import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app/toast/toast_controller.dart';
import '../../cv_bank/controller/cv_bank_controller.dart';
import '../../inbox/controller/applications_controller.dart';
import '../../inbox/models/application.dart';
import '../../profile/controller/profile_flow_controller.dart';
import '../data/mail_repository.dart';
import '../data/mail_templates.dart';

part 'compose_controller.freezed.dart';

@freezed
abstract class ComposeState with _$ComposeState {
  const factory ComposeState({
    required String to,
    required String subject,
    required String body,
    required String cvFileName,
    required String tone,
    @Default(2) int version,
    @Default(false) bool regenerating,
  }) = _ComposeState;
}

/// The application mail. [applicationId] is null for a manual mail.
class ComposeController extends AsyncNotifier<ComposeState> {
  ComposeController(this.applicationId);

  final String? applicationId;

  Application? get _application =>
      applicationId == null ? null : ref.read(applicationProvider(applicationId!));

  @override
  Future<ComposeState> build() async {
    final profile = await ref.read(careerProfileProvider.future);
    final cvs = await ref.read(cvBankControllerProvider.future);
    final app = _application;
    final cvFileName = app != null
        ? '${app.cvName}.pdf'
        : (cvs.where((c) => c.isPrimary).firstOrNull ?? cvs.firstOrNull)?.name ?? '';
    final draft = await ref
        .read(mailRepositoryProvider)
        .generateDraft(application: app, profile: profile, cvFileName: cvFileName);
    return ComposeState(
      to: draft.to,
      subject: draft.subject,
      body: draft.body,
      cvFileName: cvFileName,
      tone: profile.tone.short,
    );
  }

  void _edit(ComposeState Function(ComposeState) f) {
    final v = state.value;
    if (v != null) state = AsyncData(f(v));
  }

  void setTo(String v) => _edit((s) => s.copyWith(to: v));
  void setSubject(String v) => _edit((s) => s.copyWith(subject: v));
  void setBody(String v) => _edit((s) => s.copyWith(body: v));

  Future<void> regenerate() async {
    final current = state.value;
    if (current == null || current.regenerating) return;
    _edit((s) => s.copyWith(regenerating: true));
    final profile = await ref.read(careerProfileProvider.future);
    final draft = await ref
        .read(mailRepositoryProvider)
        .generateDraft(application: _application, profile: profile, cvFileName: current.cvFileName);
    if (!ref.mounted) return;
    final version = current.version + 1;
    _edit((s) => s.copyWith(body: draft.body, version: version, regenerating: false));
    ref.read(toastProvider.notifier).show('Redrafted as v$version');
  }

  /// Sends from the user's Google account. A draft application becomes SENT.
  Future<bool> send() async {
    final s = state.value;
    if (s == null) return false;
    final body = stripBrackets(s.body);
    try {
      await ref.read(mailRepositoryProvider).send(
        to: s.to,
        subject: s.subject,
        body: body,
        cvFileName: s.cvFileName,
      );
    } catch (_) {
      ref.read(toastProvider.notifier).show('Could not send the mail. Try again.');
      return false;
    }
    final app = _application;
    if (app != null && app.status == AppStatus.draft) {
      await ref.read(applicationsControllerProvider.notifier).markSent(app.id, mail: body);
    }
    ref.read(toastProvider.notifier).show('Sent to ${s.to}');
    return true;
  }
}

final composeControllerProvider =
    AsyncNotifierProvider.autoDispose.family<ComposeController, ComposeState, String?>(
      ComposeController.new,
    );
