import 'package:flutter/material.dart';

enum Category {
  vegetables(
    title: 'Vegetables',
    color: Color.fromARGB(255, 0, 255, 128),
  ),
  fruit(
    title: 'Fruit',
    color: Color.fromARGB(255, 145, 255, 0),
  ),
  meat(
    title: 'Meat',
    color: Color.fromARGB(255, 255, 102, 0),
  ),
  dairy(
    title: 'Dairy',
    color: Color.fromARGB(255, 0, 208, 255),
  ),
  carbs(
    title: 'Carbs',
    color: Color.fromARGB(255, 0, 60, 255),
  ),
  sweets(
    title: 'Sweets',
    color: Color.fromARGB(255, 255, 149, 0),
  ),
  spices(
    title: 'Spices',
    color: Color.fromARGB(255, 255, 187, 0),
  ),
  convenience(
    title: 'Convenience',
    color: Color.fromARGB(255, 191, 0, 255),
  ),
  hygiene(
    title: 'Hygiene',
    color: Color.fromARGB(255, 149, 0, 255),
  ),
  other(
    title: 'Other',
    color: Color.fromARGB(255, 0, 225, 255),
  );

  const Category({required this.title, required this.color});

  factory Category.byName({required String name}) {
    return Category.values.byName(name);
  }

  final String title;
  final Color color;
}
