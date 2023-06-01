import 'package:flutter/material.dart';

import 'text_default.dart';
import '../shared/styles.dart';

class TitleDefault extends StatelessWidget {
  final String _title;
  final double _fontSize;

  // const TitleDefault({required String title, double? fontSize, key? key})
  const TitleDefault({required String title, double? fontSize, super.key})
      : _title = title,
        _fontSize = fontSize ?? 18.0;

  @override
  Widget build(BuildContext context) {
    return TextDefault(
      title: _title,
      color: AppStyle.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: _fontSize,
    );
  }
}
