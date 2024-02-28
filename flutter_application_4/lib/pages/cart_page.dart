import 'package:flutter/material.dart';
import 'package:flutter_application_4/providers/cart_provider.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static const routerName = "/cart";
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Stack(
        children: [
          Positioned.fill(
            child: Consumer<CartProvider>(
              builder: (context, value, child) {
                var test = value.items.values.toList();
                print(test);
                return test.isNotEmpty
                    ? ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image(
                              image: NetworkImage(
                                test[index].image,
                              ),
                              fit: BoxFit.cover,
                            ),
                            title: Text(test[index].name),
                            subtitle: Text(
                              intl.NumberFormat.simpleCurrency(
                                      locale: 'vi', decimalDigits: 0)
                                  .format(test[index].price),
                            ),
                            trailing: SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        value.addCart(
                                          test[index].id,
                                          test[index].name,
                                          test[index].image,
                                          test[index].price,
                                        );
                                      },
                                      child: Icon(Icons.add)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(test[index].quantity.toString()),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        value.removeCart(test[index].id);
                                      },
                                      child: Icon(Icons.remove)),
                                  // Icon(Icons.add),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                        itemCount: test.length,
                      )
                    : Center(
                        child: Text("Not Found"),
                      );
              },
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Payment"),
                ),
              ))
        ],
      ),
    );
  }
}
