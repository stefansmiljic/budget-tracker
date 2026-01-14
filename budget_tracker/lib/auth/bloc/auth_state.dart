import 'package:budget_tracker/auth/models/auth_session.dart';

abstract class AuthState {}

class AuthInit extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final AuthSession session;
  Authenticated(this.session);
}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
