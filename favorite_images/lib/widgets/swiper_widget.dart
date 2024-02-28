import 'package:favorite_images/models/items_image.dart';
import 'package:favorite_images/providers/item_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:provider/provider.dart';

class SwiperWidget extends StatelessWidget {
  const SwiperWidget({Key? key, required this.isFavorite}) : super(key: key);

  final isFavorite;

  @override
  Widget build(BuildContext context) {
    print(isFavorite);
    final dataItems = Provider.of<ItemImageProvider>(context);
    final items = isFavorite ? dataItems.showItemFavorite() : dataItems.items;
    return items.isNotEmpty
        ? Swiper(
            layout: SwiperLayout.STACK,
            itemCount: items.length,
            itemHeight: 650.0,
            itemWidth: 350.0,
            itemBuilder: (BuildContext context, index) {
              return ChangeNotifierProvider.value(
                value: items[index],
                child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.white12,
                    title: Consumer<ItemImages>(
                      builder: (context, value, child) {
                        print(value);
                        return InkWell(
                          onTap: () {
                            value.updateFavorited();
                            Provider.of<ItemImageProvider>(context,
                                    listen: false)
                                .handleCountChange();
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 30,
                            color:
                                value.isFavorited ? Colors.red : Colors.white,
                          ),
                        );
                      },
                    ),
                    subtitle: Text(
                      'Favorites',
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Text(
                      items[index].name,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      items[index].image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(child: Text("not image favorite")),
          );
  }
}
