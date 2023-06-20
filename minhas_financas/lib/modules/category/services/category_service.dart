import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoryService {
  static final CategoryService _instance = CategoryService._internal();

  factory CategoryService() {
    return _instance;
  }

  CategoryService._internal();

  final _database = <Category>[];
  final categoriesNotifier = ValueNotifier<List<Category>>([]);

  List<Category> getCategories() {
    return _database;
  }

  String? save(Category category) {
    try {
      _database.add(category);
      categoriesNotifier.value = _database.map((e) => e).toList();
      return null;
    } catch (error) {
      return error.toString();
    }
  }
}
