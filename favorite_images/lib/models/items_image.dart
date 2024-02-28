import 'dart:convert';

import 'package:flutter/material.dart';

class ItemImages extends ChangeNotifier {
  String id;
  String name;
  String image;
  bool isFavorited = false;

  void updateFavorited() {
    isFavorited = !isFavorited;
    notifyListeners();
  }

  ItemImages({required this.id, required this.name, required this.image});

  //chuyển đối tượng item thành đối tượng map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{"id": id, "name": name, "image": image};
  }

  // tạo 1 đối tượng Item từ đối tượng map
  factory ItemImages.fromMap(Map<String, dynamic> map) {
    return ItemImages(id: map['id'], name: map['name'], image: map['image']);
  }

  //chuyển 1 đối tượng item thành 1 chuối json bằng cách mã hoá đối tượng thành 1 obje map sử dụng phương thức to map và sau đomã hoá thành json bằng json.endcode();
  String toJson() {
    return json.encode(toMap());
  }

  // tạo 1 đối tượng Item từ chuỗi json đã cho
  factory ItemImages.fromJson(String dataJson) {
    return new ItemImages.fromMap(json.decode(dataJson) // tạo 1 đối tượng map
        );
    //sau khi tạo đối tượng map thì dùng fromMap để tạo đối tượng Item
  }
}
