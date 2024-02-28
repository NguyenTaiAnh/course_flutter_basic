import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  static const routerName = "/product";
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    var param = ModalRoute.of(context)!.settings.arguments as Map;
    var product = param["data"];
    // print(param['data']);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(product.name),
              background: Padding(
                padding: EdgeInsets.all(80),
                child: Image.network(product.image),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      product.description,
                      maxLines: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.remove,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("1"),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
              width: double.infinity,
              child:
                  ElevatedButton(onPressed: () {}, child: Text("Add Product"))),
        )
      ],
    );
  }
}
