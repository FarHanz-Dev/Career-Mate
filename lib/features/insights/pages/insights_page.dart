import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../ui/atoms/cm_icon_button.dart';
import '../../../ui/atoms/cm_logo.dart';
import '../../../ui/templates/tab_scaffold.dart';
import '../controller/match_controller.dart';
import 'match_page.dart';

/// The Insights tab: the match breakdown for the application you last opened,
/// else the best match. The bottom tabs and drawer belong to the shell.
class InsightsPage extends ConsumerWidget {
  const InsightsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cm = context.cm;
    final id = ref.watch(insightsTargetProvider);

    return TabScaffold(
      header: TabHeader(
        child: Row(
          spacing: 10,
          children: [
            CmIconButton(
              icon: LucideIcons.menu,
              label: 'Menu',
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            Expanded(child: Text('Insights', style: cm.heading(size: 16))),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.push('/profile'),
              child: Semantics(button: true, label: 'Account', child: const CmLogo(size: 30)),
            ),
          ],
        ),
      ),
      body: id == null
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'No applications yet. Add a job posting and its match shows up here.',
                style: cm.body(size: 12, color: cm.colors.neutral700, height: 1.5),
              ),
            )
          : MatchView(applicationId: id),
    );
  }
}
