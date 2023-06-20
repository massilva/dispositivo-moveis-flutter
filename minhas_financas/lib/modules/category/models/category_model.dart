class Category {
  final String name;
  final int color;
  final String? description;

  Category({required this.name, required this.color, this.description});

  static Category get empty => Category(name: '-', color: 0xFF000000);
}
