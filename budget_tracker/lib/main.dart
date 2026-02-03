import 'package:budget_tracker/auth/bloc/auth_bloc.dart';
import 'package:budget_tracker/auth/bloc/auth_state.dart';
import 'package:budget_tracker/auth/repository/auth_repository_impl.dart';
import 'package:budget_tracker/auth/ui/login_screen.dart';
import 'package:budget_tracker/expenses/bloc/expense_event.dart';
import 'package:budget_tracker/expenses/repository/expense_repository.dart';
import 'package:budget_tracker/expenses/ui/expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'expenses/bloc/expense_bloc.dart';

void main() {
  runApp(
    BlocProvider(create: (_) => AuthBloc(AuthRepositoryImpl()),
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return BlocProvider(
              create: (_) => ExpenseBloc(
                ExpenseRepository(state.session.token))
              ..add(LoadExpenses()),
              child: ExpensesScreen(),
            );
          }
          return LoginScreen();
        },
      ),
    );
  }
}
