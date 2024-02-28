import 'package:app_food/config/const.dart';
import 'package:app_food/models/product.dart';
import 'package:app_food/providers/ProductProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeenPage extends StatefulWidget {
  const SeenPage({super.key});

  @override
  State<SeenPage> createState() => _SeenPageState();
}

class _SeenPageState extends State<SeenPage> {
  List<int> items = List<int>.generate(100, (int index) => index);
  @override
  Widget build(BuildContext context) {
    List<Product> data =
        Provider.of<ProductProvider>(context).showProductsIsSeen();
    return ListView.builder(
      itemCount: data.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Delete Product"),
                  content: const Text('Are you sure you want to delete'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text("Ok"),
                    ),
                  ],
                );
              },
            );
          },
          onDismissed: (direction) {
            data[index].toggleSeen();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Detele Success"),
              ),
            );
          },
          key: ValueKey<int>(index),
          child: ListTile(
            title: Container(
              height: 220,
              child: GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    data[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.white54,
                  title: Text(
                    data[index].title,
                    style: textStyleCustom,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
