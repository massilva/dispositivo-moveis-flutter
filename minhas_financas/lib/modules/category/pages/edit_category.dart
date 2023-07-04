import 'package:flutter/material.dart';
import 'package:minhas_financas/modules/category/models/category_model.dart';

import '../../../routes/routes_generator.dart';
import '../components/add_and_edit_category.dart';
import '../controllers/category_controller.dart';

class CategoryEditPage extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  final TextEditingController _nameEditingController;
  final TextEditingController _colorEditingController;
  final TextEditingController _descriptionEditingController;
  final CategoryController _categoryController;
  final int _index;

  CategoryEditPage({
    required CategoryController categoryController,
    required Category category,
    required int index,
    super.key,
  })  : _nameEditingController = TextEditingController(text: category.name),
        _colorEditingController = TextEditingController(
          text: category.color.toString(),
        ),
        _descriptionEditingController = TextEditingController(
          text: category.description,
        ),
        _categoryController = categoryController,
        _index = index;

  @override
  Widget build(BuildContext context) {
    return _index < 0
        ? Container(color: Colors.red)
        : AddEditCategory(
            globalKey: _key,
            nameEditingController: _nameEditingController,
            colorEditingController: _colorEditingController,
            descriptionEditingController: _descriptionEditingController,
            onPressed: () {
              if (_key.currentState!.validate()) {
                final updatedCategory = Category(
                  name: _nameEditingController.text,
                  color: int.parse(_colorEditingController.text),
                  description: _descriptionEditingController.text,
                );
                _categoryController.updateCategory(_index, updatedCategory);
                Navigator.of(context)
                    .pushReplacementNamed(RoutesGenerator.categoryPage);
              }
            },
          );
  }
}
