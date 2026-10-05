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
import '../features/insights/pages/match_page.dart';
import '../features/profile/pages/profile_flow_page.dart';
import '../features/thread/pages/thread_page.dart';
import 'app_shell.dart';

/// Paths that show the bottom tabs. The toast host reads this to sit above the FAB.
const tabPaths = {'/inbox', '/cv-bank'};

/// Sign in, then profile, then the inbox. Inbox and CV Bank live in a
/// stateful shell (bottom tabs, drawer); everything else is pushed above it.
final routerProvider = Provider<GoRouter>((ref) {
  final refresh = ValueNotifier<int>(0);
  ref.listen(authControllerProvider, (_, _) => refresh.value++);
  ref.onDispose(refresh.dispose);

  final router = GoRouter(
    initialLocation: '/sign-in',
    refreshListenable: refresh,
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);
      if (auth.isLoading) return null;
      final signedIn = auth.value != null;
      final atSignIn = state.matchedLocation == '/sign-in';
      if (!signedIn) return atSignIn ? null : '/sign-in';
      return atSignIn ? '/profile' : null;
    },
    routes: [
      GoRoute(path: '/sign-in', builder: (_, _) => const SignInPage()),
      GoRoute(path: '/profile', builder: (_, _) => const ProfileFlowPage()),
      StatefulShellRoute.indexedStack(
        builder: (_, _, shell) => AppShell(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            routes: [GoRoute(path: '/inbox', builder: (_, _) => const InboxPage())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/cv-bank', builder: (_, _) => const CvBankPage())],
          ),
        ],
      ),
      GoRoute(
        path: '/thread/:id',
        builder: (_, state) => ThreadPage(applicationId: state.pathParameters['id']!),
      ),
      GoRoute(path: '/add-job', builder: (_, _) => const AddJobPage()),
      GoRoute(
        path: '/compose',
        builder: (_, state) => ComposePage(applicationId: state.uri.queryParameters['application']),
      ),
      GoRoute(
        path: '/cv/:id',
        builder: (_, state) => CvDetailPage(cvId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/match/:id',
        builder: (_, state) => MatchPage(applicationId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/improve/:cvId',
        builder: (_, state) => ImprovePage(cvId: state.pathParameters['cvId']!),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
