import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/add_job/pages/add_job_page.dart';
import '../features/auth/controller/auth_controller.dart';
import '../features/auth/pages/sign_in_page.dart';
import '../features/compose/pages/compose_page.dart';
import '../features/cv_bank/pages/cv_bank_page.dart';
import '../features/cv_bank/pages/cv_detail_page.dart';
import '../features/inbox/pages/inbox_page.dart';
import '../features/insights/pages/improve_page.dart';
import '../features/insights/pages/insights_page.dart';
import '../features/insights/pages/match_page.dart';
import '../features/profile/pages/profile_flow_page.dart';
import '../features/thread/pages/thread_page.dart';
import 'app_shell.dart';

/// Paths that show the bottom tabs. The toast host reads this to sit above them.
const tabPaths = {'/inbox', '/cv-bank', '/insights'};

/// Every screen swaps in place, with no slide or fade in either direction.
Page<void> _instant(GoRouterState state, Widget child) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);

/// With no animation to show that a screen changed, a light tick does it.
/// Only screens count: the FAB menu and other popups are not page changes.
class _HapticPageObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute && previousRoute != null) HapticFeedback.selectionClick();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute) HapticFeedback.selectionClick();
  }
}

/// Sign in, then profile, then the inbox. Inbox, CV Bank and Insights live in a
/// stateful shell (bottom tabs, drawer); everything else is pushed above it.
final routerProvider = Provider<GoRouter>((ref) {
  final refresh = ValueNotifier<int>(0);
  ref.listen(authControllerProvider, (_, _) => refresh.value++);
  ref.onDispose(refresh.dispose);

  final router = GoRouter(
    initialLocation: '/sign-in',
    refreshListenable: refresh,
    observers: [_HapticPageObserver()],
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);
      if (auth.isLoading) return null;
      final signedIn = auth.value != null;
      final atSignIn = state.matchedLocation == '/sign-in';
      if (!signedIn) return atSignIn ? null : '/sign-in';
      return atSignIn ? '/profile' : null;
    },
    routes: [
      GoRoute(path: '/sign-in', pageBuilder: (_, state) => _instant(state, const SignInPage())),
      GoRoute(path: '/profile', pageBuilder: (_, state) => _instant(state, const ProfileFlowPage())),
      StatefulShellRoute.indexedStack(
        pageBuilder: (_, state, shell) => _instant(state, AppShell(navigationShell: shell)),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/inbox', pageBuilder: (_, state) => _instant(state, const InboxPage())),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/cv-bank', pageBuilder: (_, state) => _instant(state, const CvBankPage())),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/insights', pageBuilder: (_, state) => _instant(state, const InsightsPage())),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/thread/:id',
        pageBuilder: (_, state) =>
            _instant(state, ThreadPage(applicationId: state.pathParameters['id']!)),
      ),
      GoRoute(path: '/add-job', pageBuilder: (_, state) => _instant(state, const AddJobPage())),
      GoRoute(
        path: '/compose',
        pageBuilder: (_, state) => _instant(
          state,
          ComposePage(applicationId: state.uri.queryParameters['application']),
        ),
      ),
      GoRoute(
        path: '/cv/:id',
        pageBuilder: (_, state) => _instant(state, CvDetailPage(cvId: state.pathParameters['id']!)),
      ),
      GoRoute(
        path: '/match/:id',
        pageBuilder: (_, state) =>
            _instant(state, MatchPage(applicationId: state.pathParameters['id']!)),
      ),
      GoRoute(
        path: '/improve/:cvId',
        pageBuilder: (_, state) =>
            _instant(state, ImprovePage(cvId: state.pathParameters['cvId']!)),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
