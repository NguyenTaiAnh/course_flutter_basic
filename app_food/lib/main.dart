import 'package:app_food/page/home/home.dart';
import 'package:app_food/page/home/widgets/category.dart';
import 'package:app_food/page/home/widgets/product.dart';
import 'package:app_food/page/index.dart';
import 'package:app_food/providers/CategoryProvider.dart';
import 'package:app_food/providers/ProductProvider.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CategoryProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProductProvider(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "hello world",
      initialRoute: AppFood.routeName,
      routes: {
        AppFood.routeName: (context) => AppFood(),
        ProductPage.routeName: (context) => ProductPage(),
        CategoryPage.routeName: (context) => CategoryPage(),
      },
      // home: AppFood(),
    ),
  ));
}
