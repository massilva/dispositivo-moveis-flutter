import 'package:flutter/material.dart';
import 'package:minhas_financas/modules/category/models/category_model.dart';

import '../components/add_and_edit_category.dart';
import '../controllers/category_controller.dart';

class CategoryEditPage extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  final TextEditingController _nameEditingController;
  final TextEditingController _colorEditingController;
  final TextEditingController _descriptionEditingController;
  final CategoryController _categoryController;
  final Category _category;

  CategoryEditPage({
    required CategoryController categoryController,
    required Category category,
    super.key,
  })  : _category = category,
        _nameEditingController = TextEditingController(text: category.name),
        _colorEditingController = TextEditingController(
          text: category.color.toString(),
        ),
        _descriptionEditingController = TextEditingController(
          text: category.description,
        ),
        _categoryController = categoryController;

  @override
  Widget build(BuildContext context) {
    return AddEditCategory(
      globalKey: _key,
      nameEditingController: _nameEditingController,
      colorEditingController: _colorEditingController,
      descriptionEditingController: _descriptionEditingController,
      onPressed: () {
        if (_key.currentState!.validate()) {
          //_categoryController.updateCategory();
        }
      },
    );
  }
}
