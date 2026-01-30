import 'package:budget_tracker/expenses/bloc/expense_event.dart';
import 'package:budget_tracker/expenses/bloc/expense_state.dart';
import 'package:budget_tracker/expenses/models/expense.dart';
import 'package:budget_tracker/expenses/repository/expense_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository repository;

  ExpenseBloc(this.repository) : super(ExpensesLoading()) {
    on<LoadExpenses>(_onLoadExpenses);
    on<AddExpense>(_onAddExpense);
    on<FilterExpenses>(_onFilterExpenses);
  }

  double _calculateBalance(List<Expense> expenses) {
    double balance = 0;
    for (final e in expenses) {
      balance += e.isIncome ? e.amount : -e.amount;
    }
    return balance;
  }

  Future<void> _onLoadExpenses(
    LoadExpenses event,
    Emitter<ExpenseState> emit
  ) async {
    emit(ExpensesLoading());
    try {
      final expenses = await repository.fetchExpenses();
      emit(
        ExpensesLoaded(
          allExpenses: expenses, 
          filteredExpenses: expenses, 
          balance: _calculateBalance(expenses)
        )
      );
    } catch (e) {
      emit(ExpensesError(e.toString()));
    }
  }

  Future<void> _onAddExpense(
    AddExpense event, 
    Emitter<ExpenseState> emit
    ) async {
      if(state is! ExpensesLoaded) return;

      final currentState = state as ExpensesLoaded;
      try {
        await repository.addExpense(event.expense);

        final updatedExpenses = List<Expense>.from(currentState.allExpenses)
        ..add(event.expense);

        emit(
          ExpensesLoaded(
            allExpenses: updatedExpenses, 
            filteredExpenses: updatedExpenses, 
            balance: _calculateBalance(updatedExpenses)
            )
        );
      } catch (e) {
        emit(ExpensesError(e.toString()));
      }
  }

  void _onFilterExpenses(
    FilterExpenses event,
    Emitter<ExpenseState> emit,
  ) {
    if (state is! ExpensesLoaded) return;

    final currentState = state as ExpensesLoaded;

    final filtered = event.category == 'ALL'
        ? currentState.allExpenses
        : currentState.allExpenses
            .where((e) => e.category == event.category)
            .toList();

    emit(
      ExpensesLoaded(
        allExpenses: currentState.allExpenses,
        filteredExpenses: filtered,
        balance: _calculateBalance(filtered),
      ),
    );
  }
}