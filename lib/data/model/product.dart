// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  String id;
  String name;
  String description;
  String price;
  String favorite;
  String image;
  String submenu;
  String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.favorite,
    required this.image,
    required this.submenu,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'favorite': favorite,
      'image': image,
      'submenu': submenu,
      'category': category,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      favorite: map['favorite'] as String,
      image: map['image'] as String,
      submenu: map['submenu'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  Product copyWith({
    String? id,
    String? name,
    String? description,
    String? price,
    String? favorite,
    String? image,
    String? submenu,
    String? category,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      favorite: favorite ?? this.favorite,
      image: image ?? this.image,
      submenu: submenu ?? this.submenu,
      category: category ?? this.category,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, price: $price, favorite: $favorite, image: $image, submenu: $submenu)';
  }
}
