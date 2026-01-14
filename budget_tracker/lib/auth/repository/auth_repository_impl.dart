import 'package:budget_tracker/auth/models/auth_session.dart';
import 'package:budget_tracker/auth/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<AuthSession> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'user@test.com' && password == '123456') {
      return AuthSession(token: 'fake-jwt-token', userId: 'u1');
    } else {
      throw Exception('Invalid credentials');
    }
  }

  @override
  void logout() {}
}
