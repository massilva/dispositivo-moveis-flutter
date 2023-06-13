import 'package:flutter/material.dart';
import 'package:minhas_financas/shared/styles.dart';

class InputDefault extends StatelessWidget {
  final String _labelText;
  final String? _helperText;
  final TextEditingController? _controller;

  const InputDefault({
    required String labelText,
    TextEditingController? controller,
    String? helperText,
    super.key,
  })  : _labelText = labelText,
        _helperText = helperText,
        _controller = controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        focusedBorder: AppStyle.inputBorderDefault,
        enabledBorder: AppStyle.inputBorderDefault,
        border: AppStyle.inputBorderDefault,
        labelText: _labelText,
        labelStyle: const TextStyle(
          color: AppStyle.secondaryColor,
        ),
        helperText: _helperText,
      ),
    );
  }
}
