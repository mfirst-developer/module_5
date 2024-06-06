import 'package:flutter/material.dart';
import 'package:module_5/widgets/expenses_list.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget{
  Expenses({super.key});

  @override
  State<Expenses> createState() {
      return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{

  final List<Expense> expenses = [
    Expense(title: "Sandwich", amount: 2000.0, date: DateTime.now(), category: Category.food),
    Expense(title: "Ticket", amount: 1000.0, date: DateTime.now(), category: Category.travel),
    Expense(title: "PC club", amount: 500.0, date: DateTime.now(), category: Category.leisure),
    Expense(title: "Taxi", amount: 1500.0, date: DateTime.now(), category: Category.work),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Text('chart'),
          Expanded(child: ExpensesList(expenses: expenses))
        ],
      )
    );
  }
}