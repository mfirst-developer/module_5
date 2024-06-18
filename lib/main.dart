import 'package:flutter/material.dart';

import 'package:module_5/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 6, 255, 0));

var kColorSchemeDark = ColorScheme.fromSeed(
    brightness:Brightness.dark,
    seedColor: const Color.fromARGB(173, 7, 80, 8));

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kColorSchemeDark,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorSchemeDark.onPrimaryContainer,
            foregroundColor: kColorSchemeDark.primaryContainer
        ),
        cardTheme: const CardTheme().copyWith(
            color: kColorSchemeDark.primaryFixed,
            margin: const EdgeInsets.all(16.0)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorSchemeDark.primaryContainer
            )
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(fontWeight: FontWeight.normal,
                color: kColorSchemeDark.onSecondaryContainer,
                fontSize: 18)
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer
        ),
        cardTheme: const CardTheme().copyWith(
            color: kColorScheme.primaryFixed,
            margin: const EdgeInsets.all(16.0)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer
            )
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 18)
        ),
      ),
      home: Expenses(),
    ),
  );
}