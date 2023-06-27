import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../routes/routes_generator.dart';
import '../controllers/category_controller.dart';
import '../../../shared/validators.dart';
import '../../../components/input_default.dart';
import '../../../shared/styles.dart';
import '../../../components/image_header_default.dart';

class CategoryAddPage extends StatelessWidget {
  final TextEditingController? _nameEditingController;
  final TextEditingController? _colorEditingController;
  final TextEditingController? _descriptionEditingController;
  final _key = GlobalKey<FormState>();
  final CategoryController _categoryController;

  CategoryAddPage({required CategoryController categoryController, super.key})
      : _nameEditingController = TextEditingController(),
        _colorEditingController =
            TextEditingController(text: AppStyle.primaryColor.value.toString()),
        _descriptionEditingController = TextEditingController(),
        _categoryController = categoryController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const ImageHeaderDefault(),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed(RoutesGenerator.categoryPage);
          },
        ),
      ),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputDefault(
                  labelText: 'Nome',
                  controller: _nameEditingController,
                  validator: Validator.requiredField,
                ),
                const Divider(),
                InputDefault(
                  labelText: 'Cor',
                  controller: _colorEditingController,
                  validator: Validator.requiredField,
                  keyboardType: TextInputType.number,
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Text('Selecione uma cor!'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: Color(
                                int.parse(_colorEditingController!.text),
                              ),
                              onColorChanged: (color) {
                                _colorEditingController!.text =
                                    color.value.toString();
                              },
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('Feito'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                const Divider(),
                InputDefault(
                  labelText: 'Descrição',
                  controller: _descriptionEditingController,
                  maxLines: 3,
                  maxLength: 100,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: AppStyle.white,
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ElevatedButton(
            style: const ButtonStyle(
              // backgroundColor: MaterialStateProperty.all(
              backgroundColor: MaterialStatePropertyAll(
                AppStyle.primaryColor,
              ),
              // foregroundColor: MaterialStateProperty.all(
              foregroundColor: MaterialStatePropertyAll(
                AppStyle.white,
              ),
            ),
            onPressed: () {
              if (_key.currentState!.validate()) {
                _categoryController.saveCategory(
                  _nameEditingController!.text,
                  int.parse(_colorEditingController!.text),
                  _descriptionEditingController?.text,
                );
                Navigator.of(context)
                    .pushReplacementNamed(RoutesGenerator.categoryPage);
              }
            },
            child: const Text('Salvar'),
          ),
        ),
      ),
    );
  }
}
