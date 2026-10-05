import 'package:careermate/app/app.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/load_fonts.dart';

Future<void> _pumpApp(WidgetTester tester) async {
  await loadTestFonts();
  tester.view.physicalSize = const Size(804, 1748);
  tester.view.devicePixelRatio = 2;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(const ProviderScope(child: CareerMateApp()));
  await tester.pump(const Duration(milliseconds: 100));
}

Future<void> _settle(WidgetTester tester, [int ms = 600]) async {
  for (var i = 0; i < ms ~/ 50; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

/// Signs in with the mock Google account and skips the profile flow.
Future<void> _toInbox(WidgetTester tester) async {
  await tester.tap(find.text('Continue with Google'));
  await _settle(tester);
  expect(find.text('Career profile'), findsOneWidget);
  await tester.tap(find.text('Skip for now'));
  await _settle(tester);
}

void main() {
  testWidgets('sign in, skip the profile, land on the inbox', (tester) async {
    await _pumpApp(tester);
    expect(find.text('Continue with Google'), findsOneWidget);

    await _toInbox(tester);
    expect(find.text('ALL, 7 APPLICATIONS'), findsOneWidget);
    expect(find.text('Tokopedia'), findsOneWidget);
    expect(find.text('INBOX'), findsOneWidget);
  });

  testWidgets('a status chip filters the list', (tester) async {
    await _pumpApp(tester);
    await _toInbox(tester);

    await tester.tap(find.text('Drafts'));
    await _settle(tester);
    expect(find.text('DRAFTS, 2 APPLICATIONS'), findsOneWidget);
    expect(find.text('Gojek'), findsOneWidget);
    expect(find.text('Tokopedia'), findsNothing);
  });

  testWidgets('tapping a monogram selects the row and shows the selection bar', (tester) async {
    await _pumpApp(tester);
    await _toInbox(tester);

    await tester.tap(find.text('TO'));
    await _settle(tester);
    expect(find.text('1 selected'), findsOneWidget);

    await tester.tap(find.bySemanticsLabel('Close'));
    await _settle(tester);
    expect(find.text('1 selected'), findsNothing);
  });

  testWidgets('swiping a row right marks it replied', (tester) async {
    await _pumpApp(tester);
    await _toInbox(tester);

    // Tokopedia starts as SENT.
    await tester.drag(find.text('Tokopedia'), const Offset(300, 0));
    await _settle(tester, 800);
    expect(find.text('Marked as replied'), findsOneWidget);

    // Let the toast time out so no timer is left pending.
    await _settle(tester, 3000);
    expect(find.text('Marked as replied'), findsNothing);
  });

  testWidgets('the Insights tab shows the match breakdown with the bottom tabs still there', (tester) async {
    await _pumpApp(tester);
    await _toInbox(tester);

    await tester.tap(find.text('INSIGHTS'));
    await _settle(tester, 900);
    expect(find.text('EVIDENCE'), findsOneWidget);
    expect(find.text('INBOX'), findsOneWidget);
    expect(find.text('CV BANK'), findsOneWidget);

    // And the way back to the inbox is still one tap.
    await tester.tap(find.text('INBOX'));
    await _settle(tester);
    expect(find.text('ALL, 7 APPLICATIONS'), findsOneWidget);
  });

  testWidgets('pages swap with no transition and a light haptic tick', (tester) async {
    final haptics = <Object?>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, (call) async {
      if (call.method == 'HapticFeedback.vibrate') haptics.add(call.arguments);
      return null;
    });
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, null),
    );

    await _pumpApp(tester);
    await _toInbox(tester);
    haptics.clear();

    // Switching tab ticks once; tapping the tab you are on stays silent.
    await tester.tap(find.text('CV BANK'));
    await _settle(tester);
    expect(haptics, ['HapticFeedbackType.selectionClick']);
    await tester.tap(find.text('CV BANK'));
    await _settle(tester);
    expect(haptics, hasLength(1));
    await tester.tap(find.text('INBOX'));
    await _settle(tester);
    haptics.clear();

    // A pushed screen has no in or out animation, and ticks on the way in and out.
    await tester.tap(find.text('Xendit'));
    await tester.pump();
    final route = ModalRoute.of(tester.element(find.text('REPLY STATUS, YOU SET THIS')))!;
    expect(route.transitionDuration, Duration.zero);
    expect(route.reverseTransitionDuration, Duration.zero);
    expect(haptics, hasLength(1));

    await tester.tap(find.bySemanticsLabel('Back'));
    await tester.pump();
    expect(find.text('REPLY STATUS, YOU SET THIS'), findsNothing);
    expect(find.text('ALL, 7 APPLICATIONS'), findsOneWidget);
    expect(haptics, hasLength(2));
  });

  testWidgets('opening a row shows the thread with the reply toggle', (tester) async {
    await _pumpApp(tester);
    await _toInbox(tester);

    await tester.tap(find.text('Xendit'));
    await _settle(tester, 900);
    expect(find.text('REPLY STATUS, YOU SET THIS'), findsOneWidget);
    expect(find.text('Match 91'), findsOneWidget);

    // Messages start collapsed.
    expect(find.textContaining('Dear Hiring Team at Xendit'), findsNothing);
    await tester.tap(find.text('SHOW').last);
    await _settle(tester);
    expect(find.textContaining('Dear Hiring Team at Xendit'), findsOneWidget);
  });
}
