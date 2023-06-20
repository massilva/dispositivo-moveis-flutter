import 'package:flutter/material.dart';

import '../controllers/category_controller.dart';
import '../models/category_model.dart';
import '../../../components/title_widget.dart';
import '../../../routes/routes_generator.dart';
import '../../../shared/constants.dart';
import '../../../shared/styles.dart';
import '../../../components/image_header_default.dart';

class CategoryPage extends StatefulWidget {
  final CategoryController _controller;

  const CategoryPage({
    required CategoryController controller,
    super.key,
  }) : _controller = controller;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // late ValueNotifier<List<Category>> _categories;
  late CategoryController _controller;

  @override
  void initState() {
    // _categories = widget._controller.getCategories();
    _controller = widget._controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const ImageHeaderDefault(),
      ),
      body: Column(
        children: [
          const TitleDefault(title: 'Categorias'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Nome',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 16.0, left: 16.0),
                        child: Text(
                          'Cor',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Ação',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: AppStyle.gray,
                    height: 1,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  Expanded(
                    child: ValueListenableBuilder<List<Category>>(
                        valueListenable: _controller.categoriesNotifier,
                        builder: (context, categories, _) {
                          return ListView.builder(
                            itemCount: categories.length,
                            itemBuilder: (_, index) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Text(categories[index].name),
                                  ),
                                  Container(
                                    color: Color(categories[index].color),
                                    height: 16,
                                    width: 16,
                                  ),
                                  const Row(
                                    children: [
                                      Icon(Icons.edit),
                                      Icon(Icons.delete),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            RoutesGenerator.addCategoryPage,
          );
        },
        tooltip: AppConstants.newPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
