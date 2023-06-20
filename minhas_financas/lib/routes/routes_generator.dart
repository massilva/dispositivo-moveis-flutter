import 'package:flutter/material.dart';

import '../modules/category/controllers/category_controller.dart';
import '../modules/category/pages/add_category.dart';
import '../modules/category/services/category_service.dart';
import '../modules/home/pages/about.dart';
import '../modules/home/pages/calendar.dart';
import '../modules/category/pages/category.dart';
import '../modules/home/pages/add_click.dart';
import '../modules/home/pages/home.dart';
import '../shared/constants.dart';

class RoutesGenerator {
  static const homePage = '/';
  static const addPage = '/clique/add';
  static const aboutPage = '/about';
  static const categoryPage = '/category';
  static const calendarPage = '/calendar';
  static const addCategoryPage = '$categoryPage/add';

  RoutesGenerator._();

  static Route generate(RouteSettings settings) {
    final categoryController = CategoryController(
      categoryService: CategoryService(),
    );

    switch (settings.name) {
      case homePage:
        return _goPage(const MyHomePage(userName: 'Marcos Silva'));
      case addPage:
        return _goPage(const AddClickPage());
      case aboutPage:
        return _goPage(const AboutPage());
      case categoryPage:
        return _goPage(CategoryPage(controller: categoryController));
      case calendarPage:
        return _goPage(const CalendarPage());
      case addCategoryPage:
        return _goPage(CategoryAddPage(categoryController: categoryController));
      default:
        throw const FormatException(AppConstants.pageNotFound);
    }
  }

  static _goPage(Widget page) => MaterialPageRoute(
        builder: (_) => page,
      );
}
