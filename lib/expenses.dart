import 'package:flutter/material.dart';
import 'package:module_5/widgets/chart.dart';
import 'package:module_5/widgets/expenses_list.dart';
import 'package:module_5/widgets/new_expense.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenses = [
    Expense(
        title: "Sandwich",
        amount: 2000.0,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Ticket",
        amount: 1000.0,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: "PC club",
        amount: 500.0,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Taxi",
        amount: 1500.0,
        date: DateTime.now(),
        category: Category.work),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final ind = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              expenses.insert(ind, expense);
            });
          },
        ),
        content: Text("Expense deleted!")));
  }

  void openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(
            add: _addExpense,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget _mainContent =
        const Center(child: Text("No expenses. Add someone!"));

    if (expenses.isNotEmpty) {
      _mainContent = ExpensesList(expenses: expenses, onDelete: _removeExpense);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Expense Tracker"),
          actions: [
            IconButton(
                onPressed: openAddExpenseOverlay, icon: const Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [Chart(expenses: expenses), Expanded(child: _mainContent)],
        ));
  }
}
