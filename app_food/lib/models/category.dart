import 'dart:convert';

class Category {
  String id;
  String name;
  String image;

  Category({required this.id, required this.name, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "image": image,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }
  String toJson() {
    return jsonEncode(toMap());
  }

  factory Category.fromJson(String source) {
    return Category.fromMap(jsonDecode(source) as Map<String, dynamic>);
  }
}
