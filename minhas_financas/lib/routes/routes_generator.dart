import 'package:flutter/material.dart';
import '../modules/category/pages/edit_category.dart';

import '../modules/category/controllers/category_controller.dart';
import '../modules/category/datasources/sqlite_datasource.dart';
import '../modules/category/models/category_model.dart';
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
  static const editCategoryPage = '$categoryPage/edit';

  RoutesGenerator._();

  static Route generate(RouteSettings settings) {
    final categoryDatasource = SqliteDatasource();
    final categoryService =
        CategoryService(categoryDatasource: categoryDatasource);
    final categoryController = CategoryController(
      categoryService: categoryService,
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
      case editCategoryPage:
        // cast do argumento para o tipo Category
        List listArgs = settings.arguments as List;

        if (listArgs.isEmpty) {
          listArgs = [-1, Category.empty];
        }

        final int index = listArgs[0] as int;
        final Category category = listArgs[1] as Category;

        return _goPage(
          CategoryEditPage(
            categoryController: categoryController,
            category: category,
            index: index,
          ),
        );
      default:
        throw const FormatException(AppConstants.pageNotFound);
    }
  }

  static _goPage(Widget page) => MaterialPageRoute(
        builder: (_) => page,
      );
}
