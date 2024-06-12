import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:module_5/expenses.dart';
import 'package:module_5/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.add});

  final void Function(Expense) add;

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.travel;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final end = DateTime(now.year - 1, now.month, now.day);
    final date = await showDatePicker(
        context: context, firstDate: end, lastDate: now, currentDate: now);
    setState(() {
      _selectedDate = date;
    });
  }

  void _submitExpenseData(){
    final amount = double.tryParse(_amountController.text);
    final validAmount = amount != null && amount > 0;
    if(_titleController.text.trim().isEmpty || !validAmount || _selectedDate == null){
      showDialog(context: context, builder: (ctx) =>
          AlertDialog(
              title: const Text("Invalid input type"),
              content: const Text('Be sure that you wrote correct input data'),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(ctx);
                }, child: const Text("Okay") )
              ],
          ),
      );
    }else{
      widget.add(Expense(title: _titleController.text, amount: amount, date: _selectedDate!, category: _selectedCategory));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                      prefixText: '\$ ', label: Text("Amount")),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate != null
                        ? formatter.format(_selectedDate!)
                        : "Date"),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((item) => DropdownMenuItem(
                          value: item, child: Text(item.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      } else
                        return;
                    });
                  }),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: const Text('Save'))
            ],
          )
        ],
      ),
    );
  }
}
