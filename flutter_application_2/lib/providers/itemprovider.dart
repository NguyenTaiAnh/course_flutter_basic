import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/models/items.dart';

class ItemProver extends ChangeNotifier {
  List<Items> _items = [];

  List<Items> get items => _items;

  int _count = 0;

  int get count => _count;

  void handleCount() {
    _count = _items.where((element) => element.isFavorite).length;
    notifyListeners();
  }

  List<Items> showItemFavorite() {
    List<Items> data = _items.where((element) => element.isFavorite).toList();
    return data;
  }

  void readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/items.json');
    final parseData = await jsonDecode(response);
    // print(data);
    List<Items> data =
        List<Items>.from(parseData.map((i) => Items.fromJson(jsonEncode(i))));
    print(data);
    _items = data;
    notifyListeners();
  }
}
