import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/slider_model.dart';
import 'package:http/http.dart' as http;

class CarouselSliderProvider extends ChangeNotifier {
  Future<List<SliderModel>> listData() async {
    try {
      var url = "https://apiforlearning.zendvn.com/api/mobile/sliders";
      var response = await http.get(Uri.parse(url));
      var parseData = jsonDecode(response.body);
      // print(response);
      List<SliderModel> data = List<SliderModel>.from(
          parseData.map((i) => SliderModel.fromJson(jsonEncode(i)))).toList();
      return data;
    } catch (e) {
      return Future.error(e);
    }
  }
}
