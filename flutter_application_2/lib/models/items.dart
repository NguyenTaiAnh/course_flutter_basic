import 'dart:convert';

import 'package:flutter/material.dart';

class Items extends ChangeNotifier {
  String id;
  String name;
  String image;
  bool isFavorite = false;

  void handleUpdate() {
    isFavorite = !isFavorite;
    print(isFavorite);
    notifyListeners();
  }

  Items({required this.id, required this.name, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{"id": id, "name": name, "image": image};
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(id: map['id'], name: map['name'], image: map['image']);
  }

  String toJSon() {
    return jsonEncode(toMap());
  }

  factory Items.fromJson(String dataJson) {
    return Items.fromMap(jsonDecode(dataJson));
  }
}
