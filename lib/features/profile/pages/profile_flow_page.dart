import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../app/toast/toast_controller.dart';
import '../../../ui/templates/step_flow_scaffold.dart';
import '../../cv_bank/controller/cv_bank_controller.dart';
import '../controller/profile_flow_controller.dart';
import 'step_cv.dart';
import 'step_terms.dart';
import 'step_you.dart';

const _stepNames = ['You', 'Your CV', 'Mail & terms'];
const _nextLabels = ['Next: your CV', 'Next: mail & terms', 'Save profile'];

/// Career profile: three steps, then back to the inbox.
class ProfileFlowPage extends ConsumerWidget {
  const ProfileFlowPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(careerProfileProvider);
    return profile.when(
      loading: () => Scaffold(backgroundColor: context.cm.colors.bg),
      error: (_, _) => Scaffold(
        backgroundColor: context.cm.colors.bg,
        body: Center(
          child: Text('Could not load your profile.', style: context.cm.body()),
        ),
      ),
      data: (_) => const _ProfileFlow(),
    );
  }
}

class _ProfileFlow extends ConsumerWidget {
  const _ProfileFlow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileFlowControllerProvider);
    final flow = ref.read(profileFlowControllerProvider.notifier);
    final primary = ref.watch(primaryCvProvider);
    final p = state.profile;
    final step = state.step;
    final last = step == _stepNames.length - 1;

    void leave() => context.go('/inbox');

    return StepFlowScaffold(
      title: 'Career profile',
      stepLabel: 'STEP ${step + 1} / ${_stepNames.length}',
      stepNames: _stepNames,
      currentStep: step,
      onStepTap: flow.goToStep,
      onClose: leave,
      backLabel: step == 0 ? 'Skip for now' : 'Back',
      onBack: step == 0 ? leave : flow.back,
      nextLabel: _nextLabels[step],
      onNext: () async {
        if (!last) return flow.next();
        await flow.save();
        if (!context.mounted) return;
        ref.read(toastProvider.notifier).show('Profile saved. Drafts will use it from now on');
        leave();
      },
      children: switch (step) {
        0 => stepYouChildren(context, p, flow),
        1 => stepCvChildren(
          context,
          p,
          flow,
          primary: primary,
          // TODO(upload): replace with the real picker and parse result.
          onUpload: () => ref
              .read(toastProvider.notifier)
              .show(primary == null ? 'CV read' : '${primary.name} read, ${primary.skillsCount} skills found'),
          onOpenCvBank: () => context.go('/cv-bank'),
        ),
        _ => stepTermsChildren(context, p, flow, primary: primary),
      },
    );
  }
}
