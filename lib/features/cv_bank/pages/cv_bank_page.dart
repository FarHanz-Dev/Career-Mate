import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../app/toast/toast_controller.dart';
import '../../../core/utils/date_format.dart';
import '../../../ui/atoms/cm_checkbox.dart';
import '../../../ui/atoms/cm_label.dart';
import '../../../ui/atoms/cm_pressable.dart';
import '../../../ui/atoms/cm_tag.dart';
import '../../../ui/molecules/cm_file_icon.dart';
import '../../../ui/molecules/cm_search_bar.dart';
import '../../../ui/organisms/fab_menu.dart';
import '../../../ui/templates/tab_scaffold.dart';
import '../controller/cv_bank_controller.dart';
import '../models/cv_file.dart';

class CvBankPage extends ConsumerWidget {
  const CvBankPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cm = context.cm;
    final cvs = ref.watch(cvBankControllerProvider).value ?? const <CvFile>[];
    final visible = ref.watch(visibleCvsProvider).value ?? const <CvFile>[];
    final query = ref.watch(cvQueryProvider);
    final inContext = cvs.where((c) => c.inContext).length;

    return TabScaffold(
      header: TabHeader(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CmSearchBar(
              hint: 'Search CV files',
              value: query,
              onChanged: ref.read(cvQueryProvider.notifier).set,
              onMenu: () => Scaffold.of(context).openDrawer(),
              onAccount: () => context.push('/profile'),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                CmLabel('CV Bank, ${plural(cvs.length, 'file')}'),
                const Spacer(),
                Text('$inContext in AI context', style: cm.body(size: 11, color: cm.colors.accent700)),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          for (final cv in visible) _CvRow(key: ValueKey(cv.id), cv: cv),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 96),
            child: Text(
              'Checked files are read by the AI when it drafts mail or scores a posting. '
              'Uncheck an old CV to keep it out of the context without deleting it.',
              style: cm.body(size: 11, color: cm.colors.neutral700, height: 1.5),
            ),
          ),
        ],
      ),
      floating: [
        Positioned(
          right: 14,
          bottom: 9,
          child: CmFab(
            label: 'Upload CV',
            // TODO(upload): open file_picker once the backend can read CVs.
            onPressed: () => ref.read(toastProvider.notifier).show('Upload sheet would open here'),
          ),
        ),
      ],
    );
  }
}

class _CvRow extends ConsumerWidget {
  const _CvRow({super.key, required this.cv});

  final CvFile cv;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cm = context.cm;
    final c = cm.colors;
    return CmPressable(
      onTap: () => context.push('/cv/${cv.id}'),
      isButton: false,
      builder: (context, pressed) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: pressed ? c.surface : null,
          border: Border(bottom: cm.hairline),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            CmFileIcon(cv.ext),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cv.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: cm.body(
                      size: 14,
                      weight: cv.inContext ? FontWeight.w800 : FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Added ${longDate(cv.addedAt)} · ${plural(cv.pages, 'page')} · ${cv.skillsCount} skills read',
                    style: cm.body(size: 11, color: c.neutral700),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      CmTag(
                        cv.inContext ? 'IN AI CONTEXT' : 'EXCLUDED',
                        variant: cv.inContext ? CmTagVariant.accent : CmTagVariant.neutral,
                        fontSize: 10,
                        tracking: 0.08,
                      ),
                      CmTag('Used in ${plural(cv.usedIn, 'application')}', fontSize: 10),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: CmCheckbox(
                checked: cv.inContext,
                label: 'Include ${cv.name} in AI context',
                onChanged: (v) => ref.read(cvBankControllerProvider.notifier).setInContext(cv.id, v),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
