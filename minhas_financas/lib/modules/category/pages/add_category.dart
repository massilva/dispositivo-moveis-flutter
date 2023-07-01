import 'package:flutter/material.dart';
import 'package:minhas_financas/modules/category/components/add_and_edit_category.dart';

import '../../../routes/routes_generator.dart';
import '../controllers/category_controller.dart';
import '../../../shared/styles.dart';

class CategoryAddPage extends StatelessWidget {
  final TextEditingController _nameEditingController;
  final TextEditingController _colorEditingController;
  final TextEditingController _descriptionEditingController;
  final _key = GlobalKey<FormState>();
  final CategoryController _categoryController;

  CategoryAddPage({
    required CategoryController categoryController,
    super.key,
  })  : _nameEditingController = TextEditingController(),
        _colorEditingController =
            TextEditingController(text: AppStyle.primaryColor.value.toString()),
        _descriptionEditingController = TextEditingController(),
        _categoryController = categoryController;

  @override
  Widget build(BuildContext context) {
    return AddEditCategory(
      globalKey: _key,
      colorEditingController: _colorEditingController,
      descriptionEditingController: _descriptionEditingController,
      nameEditingController: _nameEditingController,
      onPressed: () {
        if (_key.currentState!.validate()) {
          _categoryController.saveCategory(
            _nameEditingController.text,
            int.parse(_colorEditingController.text),
            _descriptionEditingController.text,
          );
          Navigator.of(context)
              .pushReplacementNamed(RoutesGenerator.categoryPage);
        }
      },
    );
  }
}
