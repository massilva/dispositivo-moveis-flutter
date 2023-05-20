import 'package:flutter/material.dart';
import 'package:minhas_financas/pages/add_click.dart';
import 'package:minhas_financas/pages/home.dart';
import 'package:minhas_financas/shared/constants.dart';

class RoutesGenerator {
  static const homePage = '/home';
  static const addPage = '/clique/add';

  RoutesGenerator._();

  static Route generate(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(title: 'My Home'),
        );
      case addPage:
        return _goPage(const AddClickPage());
      default:
        throw const FormatException(AppConstants.pageNotFound);
    }
  }

  static _goPage(Widget page) => MaterialPageRoute(
        builder: (_) => page,
      );
}
