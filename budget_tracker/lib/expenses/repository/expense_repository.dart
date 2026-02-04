import 'dart:convert';

import 'package:budget_tracker/expenses/models/expense.dart';
import 'package:budget_tracker/expenses/models/expense_category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseRepository {
  final String token;
  static const _storageKey = 'expenses';

  ExpenseRepository(this.token);

  Future<List<Expense>> fetchExpenses() async {
    await Future.delayed(const Duration(seconds: 1));

    if (token.isEmpty) {
      throw Exception('Unauthorized');
    }

    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);

    if(jsonString == null) return [];

    final List decoded = jsonDecode(jsonString);
    return decoded.map((e)=>Expense.fromJson(e)).toList();
  }

  Future<void> addExpense(Expense expense) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (token.isEmpty) {
      throw Exception('Unauthorized');
    }

    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);

    final List<Expense> expenses = jsonString == null
        ? []
        : (jsonDecode(jsonString) as List)
             .map((e) => Expense.fromJson(e))
             .toList();
    
    expenses.add(expense);

    await prefs.setString(
      _storageKey,
      jsonEncode(expenses.map((e)=> e.toJson()).toList())
    );
  }
}