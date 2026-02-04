import 'package:budget_tracker/expenses/models/expense_category.dart';

class Expense {
  final String id;
  final String title;
  final double amount;
  final ExpenseCategory category;
  final bool isIncome;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.isIncome
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'amount': amount,
    'category': category.name,
    'isIncome': isIncome
  };

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      title: json['title'],
      amount: (json['amount'] as num).toDouble(),
      category: ExpenseCategory.values.byName(json['category']),
      isIncome: json['isIncome']
    );
  }
}