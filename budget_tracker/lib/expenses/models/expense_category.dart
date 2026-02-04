enum ExpenseCategory {
  food,
  transport,
  bills,
  entertainment,
  payment,
  other
}

extension ExpenseCategoryX on ExpenseCategory {
  String get label {
    switch (this) {
      case ExpenseCategory.food:
      return 'Food';
      case ExpenseCategory.transport:
      return 'Transport';
      case ExpenseCategory.bills:
      return 'Bills';
      case ExpenseCategory.entertainment:
      return 'Entertainment';
      case ExpenseCategory.payment:
      default:
      return 'Other';
    }
  }
}