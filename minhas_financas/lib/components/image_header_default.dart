import 'package:flutter/material.dart';

class ImageHeaderDefault extends StatelessWidget {
  const ImageHeaderDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/logo.png',
        width: 40,
      ),
    );
  }
}
