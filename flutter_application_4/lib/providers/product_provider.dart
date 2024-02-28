import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  List<ProductModel> products = [];

  Future<List<ProductModel>> getProductsSpecial() async {
    var url =
        "https://apiforlearning.zendvn.com/api/mobile/products?offset=0&sortBy=id&order=asc&special=true";
    try {
      var resp = await http.get(Uri.parse(url));
      var respData = jsonDecode(resp.body);
      var data = List<ProductModel>.from(
          respData.map((i) => ProductModel.fromJson(jsonEncode(i)))).toList();
      products = data;
      return data;
    } catch (e) {
      return Future.error(e);
    }
  }
}
