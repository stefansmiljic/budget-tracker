import 'package:budget_tracker/expenses/bloc/expense_bloc.dart';
import 'package:budget_tracker/expenses/bloc/expense_event.dart';
import 'package:budget_tracker/expenses/models/expense.dart';
import 'package:budget_tracker/expenses/models/expense_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _titleCtrl  = TextEditingController();
  final _amountCtrl = TextEditingController();

  ExpenseCategory _category = ExpenseCategory.food;
  bool _isIncome = false;

  void _save() {
    final expense = Expense(
      id: DateTime.now().toString(),
      title: _titleCtrl.text,
      amount: double.parse(_amountCtrl.text),
      category: _category,
      isIncome: _isIncome
      );

      context.read<ExpenseBloc>().add(AddExpense(expense));
      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleCtrl,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: _amountCtrl,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<ExpenseCategory>(
              initialValue: _category,
              decoration: const InputDecoration(labelText: 'Category'),
              onChanged: (value) {
                setState(() => _category = value!);
              },
              items: ExpenseCategory.values.map((c){
                return DropdownMenuItem(value: c, child: Text(c.name));
              }).toList()
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text('Income'),
              value: _isIncome,
              onChanged: (value) {
                setState(() => _isIncome = value);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _save, child: const Text('Save'))
          ],
        )
      )
    );
  }
}
