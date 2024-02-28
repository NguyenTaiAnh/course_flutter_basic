import 'package:flutter/material.dart';
import 'package:flutter_application_4/home.dart';
import 'package:flutter_application_4/pages/cart_page.dart';
import 'package:flutter_application_4/pages/category_page.dart';
import 'package:flutter_application_4/pages/login_page.dart';
import 'package:flutter_application_4/pages/product_page.dart';
import 'package:flutter_application_4/providers/auth_provider.dart';
import 'package:flutter_application_4/providers/carousel_slider_provider.dart';
import 'package:flutter_application_4/providers/cart_provider.dart';
import 'package:flutter_application_4/providers/category_provider.dart';
import 'package:provider/provider.dart';

void main() {
  var isLogin = false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CarouselSliderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.routerName,
        routes: {
          HomePage.routerName: (context) => const HomePage(),
          CategoryPage.routerName: (context) => const CategoryPage(),
          ProductPage.routerName: (context) => const ProductPage(),
          LoginPage.routerName: (context) => const LoginPage(),
          CartPage.routerName: (context) => const CartPage(),
        },
      ),
    ),
  );
}
