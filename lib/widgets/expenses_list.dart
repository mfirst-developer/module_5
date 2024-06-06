import 'package:flutter/cupertino.dart';
import 'package:module_5/widgets/expense_item.dart';

import '../models/expense.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length,itemBuilder: (ctx,index){
      return ExpenseItem(expense: expenses[index]);
    });
  }
}