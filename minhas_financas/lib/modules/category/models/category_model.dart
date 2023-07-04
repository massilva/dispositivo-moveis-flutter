import 'dart:convert';

class Category {
  final int? id;
  final String name;
  final int color;
  final String? description;

  Category({
    required this.name,
    required this.color,
    this.id,
    this.description,
  });

  static Category get empty => Category(name: '-', color: 0xFF000000);

  // Converte de Category para String
  // Versão simplicada
  // String toJson() => jsonEncode(toMap());
  // Versão didática
  String toJson() {
    // Converte o objeto Category para Map<String, Object?>
    final Map<String, Object?> map = toMap();
    // Pega o Map e converte para uma String
    return jsonEncode(map);
  }

  //Converte de String para Category
  // Versão simplicada
  // factory Category.fromJson(String json) =>
  //     Category.fromMap(jsonDecode(json) as Map<String, Object?>);
  // Versão didática
  factory Category.fromJson(String json) {
    // Converte de String para Map
    final mapCategory = jsonDecode(json) as Map<String, Object?>;
    // Converte de Map para Category
    return Category.fromMap(mapCategory);
  }

  // Converte de Category para Map
  Map<String, Object?> toMap() => {
        'name': name,
        'color': color,
        'description': description ?? '',
      };

  // Converte de Map para Category
  factory Category.fromMap(Map<String, Object?> map) => Category(
        name: map['name'] as String,
        color: map['color'] as int,
        // caso o map não tenha a chave "description" é setado o valor como null
        description: map.containsKey('description')
            ? map['description'] as String?
            : null,
        // caso o map não tenha a chave "id" é setado o valor como null
        id: map.containsKey('id') ? map['id'] as int? : null,
      );

  // Cria uma cópia da instância de Category com os campos informados atualizados
  Category copyWith({
    String? name,
    int? color,
    int? id,
    String? description,
  }) =>
      Category(
        name: name ?? this.name,
        color: color ?? this.color,
        id: id ?? this.id,
        description: description ?? this.description,
      );
}
