import 'package:flutter/material.dart';

import 'package:module_5/expenses.dart';

void main() {
  runApp(
     MaterialApp(
       theme: ThemeData(
         useMaterial3: true
       ),
      home: Expenses(),
    ),
  );
}