import 'package:flutter/cupertino.dart';
import 'package:module_5/widgets/expense_item.dart';

import '../models/expense.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses, required this.onDelete});

  final List<Expense> expenses;
  final void Function(Expense) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length,itemBuilder: (ctx,index){
      return Dismissible(
          key: ValueKey(index),
          child: ExpenseItem(expense: expenses[index]),
          onDismissed: (direction) {
            onDelete(expenses[index]);
          },
      );
    });
  }
}