import 'package:flutter/material.dart';

import 'styles.dart';

abstract class AppTheme {
  static get themeData => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppStyle.primaryColor,
        //Tema do aplicativo
        primarySwatch: MaterialColor(
          Colors.white.value,
          const {
            50: Colors.white,
            100: Colors.white,
            200: Colors.white,
            300: Colors.white,
            400: Colors.white,
            500: Colors.white,
            600: Colors.white,
            700: Colors.white,
            800: Colors.white,
            900: Colors.white,
          },
        ),
        // useMaterial3: false,
      );
}
