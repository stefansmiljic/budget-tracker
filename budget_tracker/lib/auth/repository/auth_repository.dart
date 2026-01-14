import 'package:budget_tracker/auth/models/auth_session.dart';

abstract class AuthRepository {
  Future<AuthSession> login(String email, String password);
  void logout();
}
