// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  int? id;
  String? name;
  int? price;
  String? imageUrl;
  bool? isFavorite;
  String? subMenu;
  String? descripton;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.imageUrl,
      this.isFavorite,
      this.subMenu,
      this.descripton});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
      'subMenu': subMenu,
      'descripton': descripton,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] as bool : null,
      subMenu: map['subMenu'] != null ? map['subMenu'] as String : null,
      descripton:
          map['descripton'] != null ? map['descripton'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
