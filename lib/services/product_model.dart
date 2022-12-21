// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  int? id;
  String? name;
  String? price;
  String? imageUrl;
  bool? isFavorite;
  String? subMenu;
  String? descripton;
  ProductModel({
    this.id,
    this.name,
    this.price,
    this.imageUrl,
    this.isFavorite,
    this.subMenu,
    this.descripton,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? price,
    String? imageUrl,
    bool? isFavorite,
    String? subMenu,
    String? descripton,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      subMenu: subMenu ?? this.subMenu,
      descripton: descripton ?? this.descripton,
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, price: $price, imageUrl: $imageUrl, isFavorite: $isFavorite, subMenu: $subMenu, descripton: $descripton)';
  }
}
