import 'dart:convert';

import 'package:app_food/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _items = [];
  List<Product> get items => [..._items];

  List<Product> showDataByCategoryId(categoryId) {
    return _items.where((element) => element.categoryId == categoryId).toList();
  }

  Product getProductById(id) {
    return _items.singleWhere((element) => element.id == id);
  }

  List<Product> showProductsFavorites() {
    return _items.where((element) => element.isFavorite == true).toList();
  }

  List<Product> showProductsIsSeen() {
    return _items.where((element) => element.isSeen == true).toList();
  }

  Future<List<Product>> readJson() async {
    final String json = await rootBundle.loadString("assets/json/product.json");
    final dataParse = jsonDecode(json);
    List<Product> data = List<Product>.from(
        dataParse.map((i) => Product.fromJson(jsonEncode(i))));
    _items = data;
    return data;
    // print(data);
  }
}
