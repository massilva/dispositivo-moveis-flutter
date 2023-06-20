import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../shared/validators.dart';
import 'input_default.dart';

class ColorPickerInputDefault extends StatefulWidget {
  final int _color;
  final TextEditingController? _controller;

  const ColorPickerInputDefault({
    required int color,
    TextEditingController? controller,
    super.key,
  })  : _color = color,
        _controller = controller;

  @override
  State<ColorPickerInputDefault> createState() =>
      _ColorPickerInputDefaultState();
}

class _ColorPickerInputDefaultState extends State<ColorPickerInputDefault> {
  late int _color;
  late TextEditingController _controller;

  @override
  void initState() {
    _color = widget._color;
    _controller = widget._controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(_color),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: InputDefault(
            labelText: 'Cor',
            controller: _controller,
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
                        pickerColor: Color(_color),
                        onColorChanged: (color) {
                          setState(() {
                            _color = color.value;
                            _controller.text = _color.toString();
                          });
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
        ),
      ],
    );
  }
}
