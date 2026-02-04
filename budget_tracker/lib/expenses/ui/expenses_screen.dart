import 'package:budget_tracker/expenses/bloc/expense_bloc.dart';
import 'package:budget_tracker/expenses/bloc/expense_state.dart';
import 'package:budget_tracker/expenses/models/expense_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_expense_screen.dart';

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
                        subtitle: Text(e.category.label.toString()),
                        trailing: Text(
                          (e.isIncome ? '+' : '-') + e.amount.toString(),
                          style: TextStyle(color: e.isIncome ? Colors.green : Colors.red),
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
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (ctx) => BlocProvider.value(
                value: context.read<ExpenseBloc>(),
                child: const AddExpenseScreen()
              )
            )
          );
        },
        child: const Icon(Icons.add),
        )
    );
  }
}