import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/category_model.dart';
import 'package:flutter_application_4/models/product_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  Future<List<CategoryModel>> getCategory() async {
    try {
      var url = "https://apiforlearning.zendvn.com/api/mobile/categories";
      var response = await http.get(Uri.parse(url));
      var parseData = jsonDecode(response.body);
      // print(response);
      List<CategoryModel> data = List<CategoryModel>.from(
          parseData.map((i) => CategoryModel.fromJson(jsonEncode(i)))).toList();
      return data;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<ProductModel>> getProductByCategory(id) async {
    try {
      var url =
          "https://apiforlearning.zendvn.com/api/mobile/categories/${id}/products";
      // Uri uri = Uri.parse(url);
      // final parseUri = uri.replace(queryParameters: {"special": "true"});
      // var response = await http.get(parseUri);
      var response = await http.get(Uri.parse(url));
      var parseData = jsonDecode(response.body);
      // print(response);
      List<ProductModel> data = List<ProductModel>.from(
          parseData.map((i) => ProductModel.fromJson(jsonEncode(i)))).toList();
      return data;
    } catch (e) {
      return Future.error(e);
    }
  }
}
