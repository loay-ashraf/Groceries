import 'package:flutter/material.dart';
import 'package:groceries/app/app_theme.dart';

import 'package:groceries/screens/grocery_list.dart';

class GroceriesApp extends StatelessWidget {
  const GroceriesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groceries',
      darkTheme: AppTheme.dark(),
      theme: AppTheme.light(),
      home: const GroceryList(),
    );
  }
}
