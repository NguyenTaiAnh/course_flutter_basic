// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  int id;
  String name;
  String image;
  int price;
  int price_sale_off;
  int rating;
  bool special;
  String summary;
  String description;
  bool is_new;
  int category_id;
  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.price_sale_off,
    required this.rating,
    required this.special,
    required this.summary,
    required this.description,
    required this.is_new,
    required this.category_id,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? image,
    int? price,
    int? price_sale_off,
    int? rating,
    bool? special,
    String? summary,
    String? description,
    bool? is_new,
    int? category_id,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      price_sale_off: price_sale_off ?? this.price_sale_off,
      rating: rating ?? this.rating,
      special: special ?? this.special,
      summary: summary ?? this.summary,
      description: description ?? this.description,
      is_new: is_new ?? this.is_new,
      category_id: category_id ?? this.category_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'price_sale_off': price_sale_off,
      'rating': rating,
      'special': special,
      'summary': summary,
      'description': description,
      'is_new': is_new,
      'category_id': category_id,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as int,
      price_sale_off: map['price_sale_off'] as int,
      rating: map['rating'] as int,
      special: map['special'] as bool,
      summary: map['summary'] as String,
      description: map['description'] as String,
      is_new: map['is_new'] as bool,
      category_id: map['category_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, image: $image, price: $price, price_sale_off: $price_sale_off, rating: $rating, special: $special, summary: $summary, description: $description, is_new: $is_new, category_id: $category_id)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.price == price &&
        other.price_sale_off == price_sale_off &&
        other.rating == rating &&
        other.special == special &&
        other.summary == summary &&
        other.description == description &&
        other.is_new == is_new &&
        other.category_id == category_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        price.hashCode ^
        price_sale_off.hashCode ^
        rating.hashCode ^
        special.hashCode ^
        summary.hashCode ^
        description.hashCode ^
        is_new.hashCode ^
        category_id.hashCode;
  }
}
