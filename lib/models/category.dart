import 'package:flutter/material.dart';

enum Category {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other
}

class CategoryDetails {
  const CategoryDetails(this.title, this.color);

  final String title;
  final Color color;
}
