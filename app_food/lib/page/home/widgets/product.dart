import 'package:app_food/config/const.dart';
import 'package:app_food/models/product.dart';
import 'package:app_food/providers/ProductProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  static const routeName = '/product';

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
  }

  @override
  Widget build(BuildContext context) {
    // nếu state thay đổi thì toàn bộ builder sẽ được build lại
    var isChanged = false;

    final param = ModalRoute.of(context)!.settings.arguments as Map;
    var item = Provider.of<ProductProvider>(context)
        .getProductById(param['product_id']);
    item.toggleSeen();
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        child: BackButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.white,
                        ),
                        left: 10,
                        top: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 120,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    item.toggleFavorite();
                                    setState(() {
                                      isChanged = !isChanged;
                                    });
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color: item.isFavorite
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(item.favorite),
                              ],
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.timelapse_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(item.view),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/background/background_product.png",
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(item.intro),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 35,
                            width: 167,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              "Nguyên liệu",
                              style: textStyleCustom,
                            )),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            color: Colors.white,
                            child: Text(item.ingredients),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 35,
                            width: 167,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              "Cách thực hiện",
                              style: textStyleCustom,
                            )),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            color: Colors.white,
                            child: Text(item.instructions),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
