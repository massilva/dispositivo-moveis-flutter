import 'package:flutter/material.dart';
import 'package:minhas_financas/shared/styles.dart';

class InputDefault extends StatelessWidget {
  final String _labelText;
  final String? _helperText;
  final TextEditingController? _controller;
  final String? Function(String?)? _validator;
  final int _maxLength;
  final int _maxLines;
  final TextInputType? _keyboardType;
  final void Function()? _onTap;

  const InputDefault({
    required String labelText,
    TextEditingController? controller,
    String? helperText,
    String? Function(String?)? validator,
    int? maxLength,
    int? maxLines,
    TextInputType? keyboardType,
    void Function()? onTap,
    super.key,
  })  : _labelText = labelText,
        _helperText = helperText,
        _controller = controller,
        _validator = validator,
        _maxLength = maxLength ?? 32,
        _maxLines = maxLines ?? 1,
        _keyboardType = keyboardType,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: _onTap,
      keyboardType: _keyboardType,
      maxLines: _maxLines,
      maxLength: _maxLength,
      validator: _validator,
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
