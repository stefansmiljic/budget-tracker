import 'package:budget_tracker/expenses/bloc/expense_bloc.dart';
import 'package:budget_tracker/expenses/bloc/expense_event.dart';
import 'package:budget_tracker/expenses/bloc/expense_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/expense.dart';

import '../../auth/bloc/auth_bloc.dart';
import '../../auth/bloc/auth_event.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutRequested());
            },
          ),
        ],
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpensesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ExpensesError) {
            return Center(child: Text(state.message));
          }

          if(state is ExpensesLoaded) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Balance: ${state.balance.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  )
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.filteredExpenses.length,
                    itemBuilder: (context, index) {
                      final e = state.filteredExpenses[index];
                      return ListTile(
                        title: Text(e.title),
                        subtitle: Text(e.category),
                        trailing: Text(
                          (e.isIncome ? '+' : '-') + e.amount.toString()
                        )
                      );
                    }),
                )
              ],
            );
          }

          return const SizedBox.shrink();
      }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final fakeExpense = Expense(
            id: DateTime.now().toString(),
            title: 'Text expense',
            amount: 10,
            category: 'Food',
            isIncome: false,
          );

          context.read<ExpenseBloc>().add(AddExpense(fakeExpense));
        },
        child: const Icon(Icons.add),
        )
    );
  }
}