import 'package:budget_tracker/expenses/models/expense.dart';
import 'package:equatable/equatable.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object?> get props => [];
}

class LoadExpenses extends ExpenseEvent {}

class AddExpense extends ExpenseEvent {
  final Expense expense;

  const AddExpense(this.expense);

  @override
  List<Object?> get props => [expense];
}

class FilterExpenses extends ExpenseEvent {
  final String category;

  const FilterExpenses(this.category);

  @override
  List<Object?> get props=>[category];
}