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
  const CategoryPage({required CategoryController controller, super.key})
      : _controller = controller;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List _categories = <Category>[];

  @override
  void initState() {
    _categories = widget._controller.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const ImageHeaderDefault(),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed(RoutesGenerator.homePage);
          },
        ),
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
                    child: ListView.builder(
                      itemCount: _categories.length,
                      itemBuilder: (_, index) {
                        return Row(
                          children: [
                            Expanded(
                              child: Text(_categories[index].name),
                            ),
                            Container(
                              color: Color(_categories[index].color),
                              height: 16,
                              width: 16,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      RoutesGenerator.editCategoryPage,
                                      arguments: [index, _categories[index]],
                                    );
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text(
                                            'Deseja realmente remover ?',
                                          ),
                                          content: Text(
                                              'A categoria: ${_categories[index].name}'),
                                          actions: [
                                            ElevatedButton(
                                              style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                  Colors.red,
                                                ),
                                              ),
                                              onPressed: () {
                                                widget._controller
                                                    .remove(index);
                                                Navigator.of(context).pop();
                                                // Força o rebuild da página
                                                setState(() {});
                                              },
                                              child: const Text(
                                                'Sim',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Não'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            RoutesGenerator.addCategoryPage,
            (Route route) {
              return route.isCurrent;
            },
          );
        },
        tooltip: AppConstants.newPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
