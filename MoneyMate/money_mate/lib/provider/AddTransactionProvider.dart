import '../ImportAll.dart';

import 'package:flutter/material.dart';

class AddTransactionProvider extends ChangeNotifier {
  String transactionType = 'Expense';
  String expenseType = 'Food';
  List<String> expenseOptions = [
    'Food',
    'Shopping',
    'Education',
    'Transport',
    'Health',
    'Travel',
    'Home',
    'Others',
  ];
  List<String> incomeOptions = [
    'Salary',
    'Saving',
    'Others',
  ];

  void updateTransactionType(String newType) {
    transactionType = newType;
    if (transactionType == 'Income') {
      expenseType = 'Salary';
      expenseOptions = incomeOptions;
    } else {
      expenseType = 'Health';
      expenseOptions = [
        'Food',
        'Shopping',
        'Education',
        'Transport',
        'Health',
        'Travel',
        'Home',
        'Others',
      ];
    }
    notifyListeners();
  }

  void updateExpenseType(String newType) {
    expenseType = newType;
    notifyListeners();
  }
}
