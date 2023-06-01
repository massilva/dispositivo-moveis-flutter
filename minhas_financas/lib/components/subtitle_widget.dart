import 'package:flutter/material.dart';

import 'text_default.dart';
import '../shared/styles.dart';

class SubtitleDefault extends StatelessWidget {
  final String _title;
  final double _fontSize;

  // const SubtitleDefault({required String title, double? fontSize, key? key})
  const SubtitleDefault({required String title, double? fontSize, super.key})
      : _title = title,
        _fontSize = fontSize ?? 12.0;

  @override
  Widget build(BuildContext context) {
    return TextDefault(
      title: _title,
      color: AppStyle.secondaryColor,
      fontWeight: FontWeight.normal,
      fontSize: _fontSize,
    );
  }
}
