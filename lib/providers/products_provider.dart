import 'package:flutter/material.dart';

import 'product.dart';

class ProductsProvider with ChangeNotifier{
  List<Product> _items =[
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://i.pinimg.com/564x/e5/e4/0b/e5e40b32c56b99fb5621e02eb2a4276c.jpg',
    ),  Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://images.asos-media.com/products/urban-revivo-satin-shirt-in-purple/203503958-1-purple',
    ),

    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
      'https://images.asos-media.com/products/levis-logo-racer-tank-top-in-green/204380857-1-sprucedup',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
      'https://images.asos-media.com/products/asos-design-parachute-cargo-trouser-in-washed-sand/204279791-1-sand',
    ),

  ];

  List<Product> get items{
    return [..._items];
  }
List<Product> get favoriteItems{
    return _items.where((prodItem) => prodItem.isFavorite).toList();
}
  Product findById(String id){
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(){
    //_items.add();
    notifyListeners();
  }

}