import 'dart:convert';

import 'package:favorite_images/models/items_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemImageProvider extends ChangeNotifier {
  List<ItemImages> _items = [];
  int _count = 0;
  List<ItemImages> get items => [..._items];
  int get count => _count;
  void handleCountChange() {
    _count = _items.where((element) => element.isFavorited).length;
    print(_items.where((element) => element.isFavorited).length);
    notifyListeners();
  }

  List<ItemImages> showItemFavorite() {
    List<ItemImages> data =
        _items.where((element) => element.isFavorited).toList();
    return data.isEmpty ? [] : data;
  }

  void readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/items.json');
    final parseData = await json.decode(response);
    List<ItemImages> listItems = List<ItemImages>.from(
        parseData.map((item) => ItemImages.fromJson(jsonEncode(item))));

    _items = listItems;
    notifyListeners();
  }
}
