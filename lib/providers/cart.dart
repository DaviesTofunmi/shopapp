import 'dart:core';

import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;
  CartItem({
    required this.price,
    required this.id,
    required this.quantity,
    required this.title,
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items;
  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              price: existingCartItem.price,
              id: existingCartItem.id,
              quantity: existingCartItem.quantity + 1,
              title: existingCartItem.title));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
  }
}
