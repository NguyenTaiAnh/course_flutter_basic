import 'dart:convert';

import 'package:connect_api/models/stories.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ApiService {
  Future<List<Item>?> getStories() async{
    var client = http.Client();

    var uri = Uri.parse("https://technewsvn.xyz/api/v1/stories");
    var res = await client.get(uri);
    if(res.statusCode == 200){
      var json = res.body;
      print(json);
      return Stories.fromJson(jsonDecode(json)).data.items;
    }else{
      throw Exception("Failed to load stories");
    }
  }
}