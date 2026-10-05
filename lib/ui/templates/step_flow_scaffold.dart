import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_button.dart';
import '../atoms/cm_icon_button.dart';
import '../atoms/cm_pressable.dart';

/// Multi-step flow: back bar with step counter, a segmented progress rail
/// (tap a step name to jump), scrolling [children], and Back / Next pinned at
/// the bottom of the content.
class StepFlowScaffold extends StatelessWidget {
  const StepFlowScaffold({
    super.key,
    required this.title,
    required this.stepLabel,
    required this.stepNames,
    required this.currentStep,
    required this.onStepTap,
    required this.onClose,
    required this.backLabel,
    required this.onBack,
    required this.nextLabel,
    required this.onNext,
    required this.children,
  });

  final String title;
  final String stepLabel;
  final List<String> stepNames;
  final int currentStep;
  final ValueChanged<int> onStepTap;
  final VoidCallback onClose;
  final String backLabel;
  final VoidCallback onBack;
  final String nextLabel;
  final VoidCallback onNext;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;

    return Scaffold(
      backgroundColor: c.bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(border: Border(bottom: cm.rule)),
              child: Row(
                spacing: 12,
                children: [
                  CmIconButton(icon: LucideIcons.arrowLeft, label: 'Back', onPressed: onClose),
                  Text(title, style: cm.heading(size: 17)),
                  const Spacer(),
                  Text(stepLabel, style: cm.label(size: 11, tracking: 0.08)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                spacing: 4,
                children: [
                  for (var i = 0; i < stepNames.length; i++)
                    Expanded(
                      child: SizedBox(
                        height: 4,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: i <= currentStep ? c.accent : c.neutral300,
                            borderRadius: cm.radius.smAll,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Row(
                spacing: 8,
                children: [
                  for (var i = 0; i < stepNames.length; i++)
                    Expanded(
                      child: CmPressable(
                        onTap: () => onStepTap(i),
                        semanticLabel: 'Step ${i + 1}, ${stepNames[i]}',
                        builder: (context, _) => Text(
                          stepNames[i],
                          style: cm.heading(
                            size: 10,
                            color: i == currentStep ? c.accent800 : c.neutral700,
                            tracking: 0.07,
                            height: CmTheme.natural,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 18,
                        children: [
                          ...children,
                          const Spacer(),
                          Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                child: CmButton(
                                  label: backLabel,
                                  variant: CmButtonVariant.secondary,
                                  expand: true,
                                  onPressed: onBack,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: CmButton(label: nextLabel, expand: true, onPressed: onNext),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
