import 'package:app_food/config/const.dart';
import 'package:app_food/models/product.dart';
import 'package:app_food/page/home/widgets/category_body.dart';
import 'package:app_food/page/home/widgets/product.dart';
import 'package:app_food/providers/ProductProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  static const routeName = '/category';
  @override
  Widget build(BuildContext context) {
    final param = ModalRoute.of(context)!.settings.arguments as Map;
    // var product = ProductProvider().showDataByCategoryId(param['category_id']);
    var products = Provider.of<ProductProvider>(context, listen: false)
        .showDataByCategoryId(param['category_id']);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(param['title']),
        backgroundColor: themeCustom,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: (() {
                Navigator.pushNamed(context, ProductPage.routeName,
                    arguments: {"product_id": products[index].id});
              }),
              child: ChangeNotifierProvider<Product>.value(
                value: products[index],
                child: BodyContainer(),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 5,
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
