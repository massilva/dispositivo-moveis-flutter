import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../components/image_header_default.dart';
import '../../../components/input_default.dart';
import '../../../routes/routes_generator.dart';
import '../../../shared/styles.dart';
import '../../../shared/validators.dart';

class AddEditCategory extends StatefulWidget {
  final Function() _onPressed;
  final GlobalKey<FormState> _globalKey;
  final TextEditingController _nameEditingController;
  final TextEditingController _colorEditingController;
  final TextEditingController _descriptionEditingController;

  const AddEditCategory({
    required Function() onPressed,
    required GlobalKey<FormState> globalKey,
    required TextEditingController nameEditingController,
    required TextEditingController colorEditingController,
    required TextEditingController descriptionEditingController,
    super.key,
  })  : _onPressed = onPressed,
        _globalKey = globalKey,
        _nameEditingController = nameEditingController,
        _colorEditingController = colorEditingController,
        _descriptionEditingController = descriptionEditingController;

  @override
  State<AddEditCategory> createState() => _AddEditCategoryState();
}

class _AddEditCategoryState extends State<AddEditCategory> {
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
        key: widget._globalKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputDefault(
                  labelText: 'Nome',
                  controller: widget._nameEditingController,
                  validator: Validator.requiredField,
                ),
                const Divider(),
                InputDefault(
                  labelText: 'Cor',
                  controller: widget._colorEditingController,
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
                                int.parse(widget._colorEditingController.text),
                              ),
                              onColorChanged: (color) {
                                widget._colorEditingController.text =
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
                  controller: widget._descriptionEditingController,
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
            onPressed: widget._onPressed,
            child: const Text('Salvar'),
          ),
        ),
      ),
    );
  }
}
