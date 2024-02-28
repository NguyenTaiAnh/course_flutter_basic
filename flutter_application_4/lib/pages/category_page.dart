import 'package:flutter/material.dart';
import 'package:flutter_application_4/const.dart';
import 'package:flutter_application_4/pages/product_page.dart';
import 'package:flutter_application_4/providers/category_provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  static const routerName = '/category';
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final param = ModalRoute.of(context)!.settings.arguments as Map;
    var products = Provider.of<CategoryProvider>(context)
        .getProductByCategory(param["id"]);
    return Scaffold(
      appBar: AppBar(
        title: Text(param['name']),
      ),
      body: FutureBuilder(
        future: products,
        initialData: [],
        builder: (context, snapshot) {
          // print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          var productItem = snapshot.hasData ? snapshot.data! : [];
          return Padding(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: productItem.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 3 / 4),
              itemBuilder: (context, index) {
                return snapshot.hasData
                    ? GridTile(
                        footer: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GridTileBar(
                            backgroundColor: Colors.black45,
                            title: Text(productItem[index].name),
                            subtitle: Column(children: [
                              Text(
                                productItem[index].summary,
                              ),
                              // Text(
                              //   "đ " + productItem[index].price.toString(),
                              //   style: TextStyle(
                              //     color: Colors.grey,
                              //     decoration: TextDecoration.lineThrough,
                              //   ),
                              // ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "đ " + productItem[index].price.toString(),
                                style: textStyleCustom,
                              )
                            ]),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ProductPage.routerName,
                                  arguments: {"data": productItem[index]});
                            },
                            child: Image.network(productItem[index].image),
                          ),
                        ),
                      )
                    : Container(
                        child: Text("not fund"),
                      );
              },
            ),
          );
        },
      ),
    );
  }
}
