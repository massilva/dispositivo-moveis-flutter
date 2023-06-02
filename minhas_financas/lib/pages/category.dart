import 'package:flutter/material.dart';

import '../routes/routes_generator.dart';
import '../shared/constants.dart';
import '../shared/styles.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppStyle.primaryColor,
              ),
              child: SizedBox.shrink(),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(AppConstants.home),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.homePage);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text(AppConstants.category),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.categoryPage);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text(AppConstants.calendar),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.calendarPage);
              },
            ),
            ListTile(
              leading: const Icon(Icons.toc_outlined),
              title: const Text(AppConstants.about),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.aboutPage);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Categoria'),
      ),
    );
  }
}
