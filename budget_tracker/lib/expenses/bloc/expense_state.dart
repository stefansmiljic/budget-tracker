import 'package:budget_tracker/expenses/models/expense.dart';
import 'package:equatable/equatable.dart';

abstract class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object?> get props => [];
}

class ExpensesLoading extends ExpenseState {}

class ExpensesLoaded extends ExpenseState {
  final List<Expense> allExpenses;
  final List<Expense> filteredExpenses;
  final double balance;

  const ExpensesLoaded({
    required this.allExpenses,
    required this.filteredExpenses,
    required this.balance
  });

  @override
  List<Object?> get props => [allExpenses, filteredExpenses, balance];
}

class ExpensesError extends ExpenseState {
  final String message;

  const ExpensesError(this.message);

  @override
  List<Object?> get props => [message];
}
