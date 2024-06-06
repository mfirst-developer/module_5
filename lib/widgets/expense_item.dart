import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_5/models/expense.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
      child: Column(
        children: [
          Text(expense.title),
          SizedBox(height: 4,),
          Row(
            children: [
              Text('\$${expense.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(children: [
                Icon(Icons.alarm),
                SizedBox(width: 8,),
                Text(expense.date.toString())
              ],)
            ],
          )
        ],
      ),
    ),);
  }
}