import 'package:flutter/material.dart';
import 'package:flutter_application_4/providers/cart_provider.dart';
import 'package:flutter_application_4/providers/product_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

class HomeProductSpecial extends StatelessWidget {
  const HomeProductSpecial({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: [],
      future: ProductProvider().getProductsSpecial(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var productItem = snapshot.hasData ? snapshot.data : [];
        return Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Danh mục sản phẩm",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Tất cả ( 10 )"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: productItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image(
                        image: NetworkImage(
                          productItem[index].image,
                        ),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        productItem[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addCart(
                            productItem[index].id,
                            productItem[index].name,
                            productItem[index].image,
                            productItem[index].price,
                          );
                        },
                        child: Icon(
                          Icons.shopping_cart_checkout,
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   productItem[index].summary,
                            // ),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            RatingBar.builder(
                              itemSize: 15,
                              initialRating:
                                  productItem[index].rating.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              ignoreGestures: true,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              intl.NumberFormat.simpleCurrency(
                                      locale: 'vi', decimalDigits: 0)
                                  .format(productItem[index].price)
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
