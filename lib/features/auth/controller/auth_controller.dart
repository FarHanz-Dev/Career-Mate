import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/auth_repository.dart';

/// The signed-in user, or null. The router redirects on this.
class AuthController extends AsyncNotifier<AuthUser?> {
  @override
  Future<AuthUser?> build() => ref.watch(authRepositoryProvider).currentUser();

  Future<void> signIn() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).signInWithGoogle());
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
    state = const AsyncData(null);
  }
}

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthUser?>(AuthController.new);
