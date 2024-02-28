import 'dart:convert';

import 'package:app_food/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _items = [];
  List<Category> get items => [..._items];

  Future<List<Category>> readJson() async {
    final String json =
        await rootBundle.loadString("assets/json/category.json");
    final dataParse = jsonDecode(json);
    List<Category> data = List<Category>.from(
        dataParse.map((i) => Category.fromJson(jsonEncode(i))));
    _items = data;
    notifyListeners();
    return data;
    // print(data);
  }
}
