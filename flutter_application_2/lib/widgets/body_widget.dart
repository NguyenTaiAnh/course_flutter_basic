import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/items.dart';
import 'package:flutter_application_2/providers/itemprovider.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:provider/provider.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    required this.isValid,
    Key? key,
  }) : super(key: key);

  final isValid;

  @override
  Widget build(BuildContext context) {
    print(isValid);
    final dataItems = Provider.of<ItemProver>(context);
    final items = isValid ? dataItems.showItemFavorite() : dataItems.items;
    return items.isNotEmpty
        ? Swiper(
            layout: SwiperLayout.STACK,
            itemCount: items.length,
            itemHeight: 680,
            itemWidth: 340,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                value: items[index],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GridTile(
                    footer: GridTileBar(
                      backgroundColor: Colors.white12,
                      subtitle: Text(
                        "Favorite",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      title: Consumer<Items>(
                        builder: (context, value, child) {
                          print(isValid);
                          return InkWell(
                            onTap: (() {
                              value.handleUpdate();
                              Provider.of<ItemProver>(context, listen: false)
                                  .handleCount();
                            }),
                            child: Icon(
                              Icons.favorite,
                              size: 30,
                              color:
                                  value.isFavorite ? Colors.red : Colors.white,
                            ),
                          );
                        },
                      ),
                      trailing: Text(
                        items[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    child: Image.network(
                      items[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          )
        : Container(
            child: Center(child: Text("NOT Image")),
          );
  }
}
