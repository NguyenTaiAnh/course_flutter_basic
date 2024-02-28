import 'dart:ffi';

import 'package:flutter/material.dart';

class ItemCart {
  final int id;
  final String image;
  final String name;
  final int price;
  final int quantity;

  ItemCart({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CartProvider extends ChangeNotifier {
  Map<int, ItemCart> items = {};
  void addCart(int productId, String name, String image, int price,
      [int quantity = 1]) {
    if (items.containsKey(productId)) {
      items.update(
          productId,
          (value) => ItemCart(
              id: value.id,
              image: value.image,
              name: value.name,
              price: value.price,
              quantity: value.quantity + quantity));
    } else {
      items.putIfAbsent(
          productId,
          () => ItemCart(
              id: productId,
              image: image,
              name: name,
              price: price,
              quantity: quantity));
    }
    notifyListeners();
  }

  void removeCart(int productId) {
    if (items.containsKey(productId)) {
      ItemCart? value = items[productId];
      if (value!.quantity <= 1) {
        items.remove(productId);
      } else {
        items.update(
            productId,
            (value) => ItemCart(
                id: value.id,
                image: value.image,
                name: value.name,
                price: value.price,
                quantity: value.quantity - 1));
      }
    }
    //
    notifyListeners();
  }
}
