import 'dart:convert';

import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  String id;
  String categoryId;
  String title;
  String image;
  String intro;
  String ingredients;
  String instructions;
  String view;
  String favorite;

  bool isSeen = false;

  bool isFavorite = false;

  Product({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.image,
    required this.intro,
    required this.ingredients,
    required this.instructions,
    required this.view,
    required this.favorite,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    favorite = isFavorite
        ? (int.parse(favorite) + 1).toString()
        : (int.parse(favorite) - 1).toString();
    notifyListeners();
  }

  void toggleSeen() {
    if (isSeen == false) {
      isSeen = true;
      view = (int.parse(view) + 1).toString();
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "categoryId": categoryId,
      "title": title,
      "image": image,
      "intro": intro,
      "ingredients": ingredients,
      "instructions": instructions,
      "view": view,
      "favorite": favorite,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map["id"] as String,
      categoryId: map["categoryId"] as String,
      title: map["title"] as String,
      image: map["image"] as String,
      intro: map["intro"] as String,
      ingredients: map["ingredients"] as String,
      instructions: map["instructions"] as String,
      view: map["view"] as String,
      favorite: map["favorite"] as String,
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory Product.fromJson(String source) {
    return Product.fromMap(jsonDecode(source));
  }
}
/***
 * {
        "id": "m1",
        "categoryId": "c1",
        "title": "Cách xào lòng lợn với dưa cải chua không đắng, đậm đà hao cơm",
        "image": "assets/images/meal/m1.png",
        "intro": "Lòng lợn xào dưa cải chua là sự kết hợp không chỉ từ hương vị chua chua nhờ cải chua. Món xào đặc biệt này còn mang tới cho thực khách một cảm nhận hoàn toàn mới lạ, khác hẳn so với các món ăn cổ truyền được chế biến từ lòng lợn, và bây giờ các bạn hãy chuẩn bị nguyên liệu để cùng vào bếp thực hành chế biến món xào này ",
        "ingredients": "1 bộ lòng non\n1 bát dưa chua/\n1 chút hành lá\n1 củ hành tím\n1-2 quả cà chua\n1 chút tỏi\n1 thìa nước mắm\n1 chút bột nêm, bột ngọt, tiêu\n1 nhánh gừng\nỚt vừa ăn\nDầu ăn",
        "instructions": "– Bước 1: Lấy một mẩu gừng cho vào đầu lòng non để lọt vào trong, vuốt cho miếng gừng chạy dọc từ đầu này qua đầu kia. Sau đó bóp lòng với 1 chút giấm, muối rồi rửa lại cho sạch.\n– Bước 2: Đổ nước vào nồi đun sôi cùng với 1 nhánh gừng đập dập, 1 chút muối cho nước sôi mới cho lòng heo luộc trong 30 giây là vớt ngay. Thả lòng vào chén nước lạnh ngâm trong 30 phút cho nguội và lòng được trắng giòn.\n– Bước 3: Tiếp theo, bạn rửa sạch cà chua, cắt bỏ núm và thái múi cau. Hành tỏi băm nhỏ, hành lá thái khúc.\n– Bước 4: Vớt lòng non ra cho ráo nước rồi thái miếng dài chừng 2 đốt ngón tay.\n– Bước 5: Đặt chảo lên bếp, cho vào 2 thìa dầu ăn, khi dầu đã bắt đầu nóng thì cho tỏi, hành phi thơm vàng, cho cà chua vào xào, nêm thêm chút muối cho cà chua chín mềm.\n– Bước 6: Sau đó, bạn cho dưa chua vào xào sơ qua rồi cho chút lòng nong vào, nêm thêm với gia vị gồm: mắm, ớt, tiêu, hạt nêm, bột ngọt cho vừa miệng. Bạn dùng đũa đảo đều, rắc thêm hành lá lên trên là hoàn thành món ăn rồi.",
        "view": "130",
        "favorite": "67"
    },
 */