import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthUser {
  const AuthUser({required this.email});

  final String email;
}

/// Google is the only way in: mail is sent from the user's own account.
/// The real implementation uses `google_sign_in` with the `gmail.send` scope
/// only. CareerMate never requests read scopes.
abstract class AuthRepository {
  Future<AuthUser?> currentUser();
  Future<AuthUser> signInWithGoogle();
  Future<void> signOut();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) => MockAuthRepository());

class MockAuthRepository implements AuthRepository {
  AuthUser? _user;

  @override
  Future<AuthUser?> currentUser() async => _user;

  @override
  Future<AuthUser> signInWithGoogle() async => _user = const AuthUser(email: 'karim@gmail.com');

  @override
  Future<void> signOut() async => _user = null;
}
