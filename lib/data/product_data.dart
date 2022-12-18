class ProductModel {
  final int id;
  final String name;
  final String price;
  final String imageUrl;
  final bool isFavorite;
  final String subMenu;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.isFavorite,
    required this.subMenu,
  });
}

final List<ProductModel> listProduct = [
  ProductModel(
    id: 1,
    name: 'Espresso',
    price: '79.000',
    imageUrl: 'assets/product/image/product1.jpg',
    isFavorite: true,
    subMenu: 'coffe',
  ),
  ProductModel(
    id: 2,
    name: 'Macchiato',
    price: '94.000',
    imageUrl: 'assets/product/image/product2.png',
    isFavorite: false,
    subMenu: 'coffe',
  ),
  ProductModel(
    id: 3,
    name: 'Latte',
    price: '104.000',
    imageUrl: 'assets/product/image/product3.jpg',
    isFavorite: false,
    subMenu: 'coffe',
  ),
  ProductModel(
    id: 4,
    name: 'Cappochino',
    price: '94.000',
    imageUrl: 'assets/product/image/product4.jpg',
    isFavorite: false,
    subMenu: 'coffe',
  ),
  ProductModel(
    id: 5,
    name: 'Mocha',
    price: '94.000',
    imageUrl: 'assets/product/image/product5.jpg',
    isFavorite: false,
    subMenu: 'coffe',
  ),
  ProductModel(
    id: 6,
    name: 'Affogato',
    price: '94.000',
    imageUrl: 'assets/product/image/product6.jpg',
    isFavorite: false,
    subMenu: 'coffe',
  ),
  ProductModel(
    id: 7,
    name: 'Americano',
    price: '94.000',
    imageUrl: 'assets/product/image/product6.jpg',
    isFavorite: false,
    subMenu: 'coffe',
  ),
];
