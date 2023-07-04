import 'package:shared_preferences/shared_preferences.dart';

import '../models/category_model.dart';
import 'category_datasource.dart';

class CategorySharedPreferencesDatasource implements CategoryDatasource {
  static const String _kCategoriesKey = 'categories';

  @override
  Future<void> insert(Category category) async {
    // pega a instância do objeto SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    // pega as categorias que já foram salvas
    final categories = prefs.getStringList(_kCategoriesKey) ?? [];
    // Simula o autoincrement usado em banco de dados
    final copiedCategory = category.copyWith(id: categories.length);
    categories.add(copiedCategory.toJson());
    // Salva a nova lista localmente
    await prefs.setStringList(_kCategoriesKey, categories);
  }

  @override
  Future<void> update(Category category) async {
    // pega a instância do objeto SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    // pega as categorias que já foram salvas
    final categoriesString = prefs.getStringList(_kCategoriesKey) ?? [];
    /*
    Pela lógica feita no `insert` o ID da categoria é o mesmo que a posição na lista.
    Não confunda o função `map` com a classe `Map`.
    Em cada elemento que estiver em categoriesString executo o método Category.fromJson informando ele como argumento.
    */
    final categories = categoriesString.map(Category.fromJson).toList();
    // Aqui poderia ser checado se o `id` de category foi informado, caso não poderia estourar uma exceção.
    categories[category.id!] = category;
    // atualiza a base com a nova lista
    await prefs.setStringList(
        _kCategoriesKey, categories.map((e) => e.toJson()).toList());
  }

  @override
  Future<void> delete(Category category) async {
    // pega a instância do objeto SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    // pega as categorias que já foram salvas
    final categoriesString = prefs.getStringList(_kCategoriesKey) ?? [];
    // converte a lista de String para lista de Category
    final categories = categoriesString.map(Category.fromJson).toList();
    // remove buscando pelo ID
    categories.removeWhere((element) => element.id == category.id);
    // atualiza a base com a nova lista
    await prefs.setStringList(
        _kCategoriesKey, categories.map((e) => e.toJson()).toList());
  }

  @override
  Future<List<Category>> getAll() async {
    // pega a instância do objeto SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    // pega as categorias que já foram salvas
    final categoriesString = prefs.getStringList(_kCategoriesKey) ?? [];
    //Convere a lista de categorias de String para Category
    // Versão didática
    final List<Category> allCategories = [];
    for (final categoryJson in categoriesString) {
      allCategories.add(Category.fromJson(categoryJson));
    }
    return allCategories;
    // Versão simplificada
    // return categoriesString.map(Category.fromJson).toList();
  }

  @override
  Future<void> deleteById(int id) async {
    //TODO: generalizar o `delete` e o `deleteById`, pois só há diferença na função de remoção

    // pega a instância do objeto SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    // pega as categorias que já foram salvas
    final categoriesString = prefs.getStringList(_kCategoriesKey) ?? [];
    // converte a lista de String para lista de Category
    final categories = categoriesString.map(Category.fromJson).toList();
    // remove buscando pelo ID
    categories.removeAt(id);
    // atualiza a base com a nova lista
    await prefs.setStringList(
        _kCategoriesKey, categories.map((e) => e.toJson()).toList());
  }
}
