import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../ui/atoms/cm_button.dart';
import '../../../ui/atoms/cm_tag.dart';
import '../../../ui/atoms/cm_text_field.dart';
import '../../../ui/templates/detail_scaffold.dart';
import '../../auth/controller/auth_controller.dart';
import '../../profile/controller/profile_flow_controller.dart';
import '../controller/compose_controller.dart';

/// The application mail. Bracketed text marks what was pulled from the
/// posting and the CV, and it can be edited before sending.
class ComposePage extends ConsumerWidget {
  const ComposePage({super.key, this.applicationId});

  final String? applicationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cm = context.cm;
    final provider = composeControllerProvider(applicationId);
    final compose = ref.watch(provider);
    final controller = ref.read(provider.notifier);
    final from = ref.watch(authControllerProvider).value?.email ??
        ref.watch(careerProfileProvider).value?.email ??
        '';

    return DetailScaffold(
      title: 'Application mail',
      onBack: () => context.pop(),
      actions: [
        CmButton(
          label: 'Send',
          onPressed: compose.value == null
              ? null
              : () async {
                  final sent = await controller.send();
                  if (sent && context.mounted) context.go('/inbox');
                },
        ),
      ],
      body: compose.when(
        loading: () => const SizedBox.shrink(),
        error: (_, _) => Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Could not prepare the draft.', style: cm.body(color: cm.colors.neutral700)),
        ),
        data: (s) => ListView(
          padding: EdgeInsets.zero,
          children: [
            _HeaderRow(
              label: 'From',
              child: Row(
                children: [
                  Expanded(child: Text(from, style: cm.body(size: 14))),
                  Icon(LucideIcons.chevronDown, size: 16, color: cm.colors.text),
                ],
              ),
            ),
            _HeaderRow(
              label: 'To',
              child: CmTextField(
                bare: true,
                minHeight: 22,
                value: s.to,
                onChanged: controller.setTo,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            _HeaderRow(
              label: 'Subject',
              thick: true,
              child: CmTextField(
                bare: true,
                minHeight: 22,
                value: s.subject,
                fontWeight: FontWeight.w600,
                onChanged: controller.setSubject,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: cm.colors.surface,
                border: Border(bottom: cm.hairline),
              ),
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  CmTag('AI draft · v${s.version}', variant: CmTagVariant.accent),
                  if (s.cvFileName.isNotEmpty) CmTag(s.cvFileName),
                  CmTag('Tone: ${s.tone}', variant: CmTagVariant.outline),
                ],
              ),
            ),
            CmTextField(
              bare: true,
              minHeight: 340,
              maxLines: null,
              fontSize: 13.5,
              height: 1.6,
              padding: const EdgeInsets.all(16),
              value: s.body,
              onChanged: controller.setBody,
              keyboardType: TextInputType.multiline,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 10,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: cm.colors.accent, width: 2)),
                    ),
                    child: Text(
                      'Text in [square brackets] came from the posting screenshot and your CV. '
                      'Tap any bracket to swap the wording before sending.',
                      style: cm.body(size: 11, color: cm.colors.neutral700, height: 1.5),
                    ),
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: CmButton(
                          label: s.regenerating ? 'Redrafting' : 'Regenerate',
                          variant: CmButtonVariant.secondary,
                          expand: true,
                          onPressed: s.regenerating ? null : controller.regenerate,
                        ),
                      ),
                      Expanded(
                        child: CmButton(
                          label: 'Change CV',
                          variant: CmButtonVariant.secondary,
                          expand: true,
                          onPressed: () => context.go('/cv-bank'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow({required this.label, required this.child, this.thick = false});

  final String label;
  final Widget child;
  final bool thick;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      decoration: BoxDecoration(border: Border(bottom: thick ? cm.rule : cm.hairline)),
      child: Row(
        spacing: 10,
        children: [
          SizedBox(
            width: 52,
            // One word that may overrun the 52px cell, like the prototype, rather than wrap.
            child: Text(
              label.toUpperCase(),
              softWrap: false,
              overflow: TextOverflow.visible,
              style: cm.label(size: 11, tracking: 0.08),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
