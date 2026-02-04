import 'package:budget_tracker/expenses/models/expense.dart';
import 'package:budget_tracker/expenses/models/expense_category.dart';

class ExpenseRepository {
  final String token;

  ExpenseRepository(this.token);

  final List<Expense> _expenses = [
    Expense(
      id: '1',
      title: 'Nabavka',
      amount: 100.0,
      category: ExpenseCategory.food,
      isIncome: false
    ),
    Expense(
      id: '2',
      title: 'Plata',
      amount: 100000.00,
      category: ExpenseCategory.payment,
      isIncome: true
    )
  ];

  Future<List<Expense>> fetchExpenses() async {
    await Future.delayed(const Duration(seconds: 1));

    if (token.isEmpty) {
      throw Exception('Unauthorized');
    }

    return List.from(_expenses);
  }

  Future<void> addExpense(Expense expense) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (token.isEmpty) {
      throw Exception('Unauthorized');
    }

    _expenses.add(expense);
  }
}