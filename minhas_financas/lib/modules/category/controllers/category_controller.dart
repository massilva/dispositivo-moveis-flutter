import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../services/category_service.dart';

class CategoryController {
  final CategoryService _categoryService;

  CategoryController({required CategoryService categoryService})
      : _categoryService = categoryService;

  ValueNotifier<List<Category>> get categoriesNotifier =>
      _categoryService.categoriesNotifier;

  List<Category> getCategories() => _categoryService.getCategories();

  String? saveCategory(String name, int color, String? description) {
    return _categoryService.save(
      Category(
        name: name,
        color: color,
        description: description,
      ),
    );
  }
}
