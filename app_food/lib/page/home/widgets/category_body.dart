import 'package:app_food/config/const.dart';
import 'package:app_food/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyContainer extends StatefulWidget {
  const BodyContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyContainer> createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {
  var isChanged = false;
  @override
  Widget build(BuildContext context) {
    setState(() {
      isChanged = true;
    });
    var product = Provider.of<Product>(context);
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.white54,
          title: Center(child: Text(product.title, style: textStyleCustom)),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<Product>(
                builder: (context, value, child) {
                  print(value.view);
                  return Row(
                    children: [
                      InkWell(
                          onTap: () {
                            print("object");
                            value.toggleFavorite();
                          },
                          child: Icon(
                            Icons.favorite,
                            color: value.isFavorite ? Colors.red : Colors.white,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(product.favorite, style: textStyleCustom),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.timelapse_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(product.view, style: textStyleCustom),
                    ],
                  );
                },
              )
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            product.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
