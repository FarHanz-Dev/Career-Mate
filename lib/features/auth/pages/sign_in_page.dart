import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../ui/atoms/cm_button.dart';
import '../../../ui/atoms/cm_logo.dart';
import '../../../ui/molecules/cm_step_badge.dart';
import '../controller/auth_controller.dart';
import 'google_mark.dart';

const _steps = [
  'Drop in a screenshot of the job posting.',
  'CareerMate matches it against your CV.',
  'Review the draft, then send it yourself.',
];

/// Full accent field, then a white panel with the one way in: Google.
class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cm = context.cm;
    final c = cm.colors;
    const white = Color(0xFFFFFFFF);
    final signingIn = ref.watch(authControllerProvider).isLoading;

    return Scaffold(
      backgroundColor: c.accent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 22,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 16,
                          children: [
                            const CmLogo(size: 96, inverse: true),
                            Text(
                              'CAREER\nMATE',
                              style: cm.heading(size: 52, color: white, height: 0.94, tracking: -0.035),
                            ),
                          ],
                        ),
                        Container(
                          width: 120,
                          height: 2,
                          margin: const EdgeInsets.fromLTRB(0, 22, 0, 18),
                          color: white.withValues(alpha: 0.9),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 280),
                          child: Text(
                            'Read the posting. Match your CV. Send the mail.',
                            style: cm.body(size: 17, weight: FontWeight.w600, color: white, height: 1.4),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 11,
                        children: [
                          for (var i = 0; i < _steps.length; i++)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              spacing: 11,
                              children: [
                                CmStepBadge('${i + 1}'),
                                Expanded(
                                  child: Text(
                                    _steps[i],
                                    style: cm.body(size: 14, color: white, height: 1.45),
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
            ),
          ),
          Container(
            color: c.bg,
            padding: EdgeInsets.fromLTRB(
              24,
              26,
              24,
              30 + MediaQuery.viewPaddingOf(context).bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 14,
              children: [
                _GoogleButton(
                  onPressed: signingIn ? null : () => ref.read(authControllerProvider.notifier).signIn(),
                ),
                Text(
                  'Mail is sent from your own Google account, so Google is the only way in.',
                  textAlign: TextAlign.center,
                  style: cm.body(size: 12.5, color: c.neutral800, height: 1.5),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(border: Border(top: cm.hairline)),
                  child: Text(
                    'CareerMate reads only the screenshots and CV files you upload. Nothing is sent without your tap.',
                    textAlign: TextAlign.center,
                    style: cm.body(size: 11, color: c.neutral700, height: 1.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GoogleButton extends StatelessWidget {
  const _GoogleButton({required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final c = context.cm.colors;
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: Color(0x242D2B2B), blurRadius: 2, offset: Offset(0, 1))],
      ),
      child: CmButton(
        label: 'Continue with Google',
        onPressed: onPressed,
        variant: CmButtonVariant.secondary,
        background: const Color(0xFFFFFFFF),
        border: c.neutral400,
        textColor: c.neutral900,
        minHeight: 54,
        fontSize: 15.5,
        expand: true,
        alignment: MainAxisAlignment.center,
        icon: const Padding(padding: EdgeInsets.only(right: 6), child: GoogleMark()),
      ),
    );
  }
}
