import 'package:flutter/material.dart';

import 'package:groceries/models/category.dart';

const categories = {
  Category.vegetables: CategoryDetails(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Category.fruit: CategoryDetails(
    'Fruit',
    Color.fromARGB(255, 145, 255, 0),
  ),
  Category.meat: CategoryDetails(
    'Meat',
    Color.fromARGB(255, 255, 102, 0),
  ),
  Category.dairy: CategoryDetails(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255),
  ),
  Category.carbs: CategoryDetails(
    'Carbs',
    Color.fromARGB(255, 0, 60, 255),
  ),
  Category.sweets: CategoryDetails(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  Category.spices: CategoryDetails(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  Category.convenience: CategoryDetails(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  Category.hygiene: CategoryDetails(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  Category.other: CategoryDetails(
    'Other',
    Color.fromARGB(255, 0, 225, 255),
  ),
};
