import 'package:badges/badges.dart';
import 'package:favorite_images/models/items_image.dart';
import 'package:favorite_images/providers/item_image_provider.dart';
import 'package:favorite_images/widgets/swiper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: impl ement build
    return ChangeNotifierProvider(
      create: (_) => ItemImageProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My App",
        home: FavoriteImage(),
      ),
    );
  }
}

enum filterItem { all, favorite }

class FavoriteImage extends StatefulWidget {
  FavoriteImage({super.key});

  @override
  State<FavoriteImage> createState() => _FavoriteImageState();
}

class _FavoriteImageState extends State<FavoriteImage> {
//final chỉ thay đổi khi ở trong contructor của nó thay đổi
  final List<ItemImages> itemImages = [];

  bool isFavorited = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ItemImageProvider>(context, listen: false).readJson();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.yellow],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        title: const Text("Favorite Images"),
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                setState(() {
                  if (value == filterItem.all) {
                    isFavorited = false;
                  } else {
                    isFavorited = true;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Favorite'),
                      value: filterItem.favorite,
                    ),
                    PopupMenuItem(
                      child: Text('All'),
                      value: filterItem.all,
                    )
                  ])
        ],
        leading: Padding(
          padding: EdgeInsets.all(12),
          child: Consumer<ItemImageProvider>(
            builder: (context, value, child) {
              return Badge(
                badgeContent: Text(
                  Provider.of<ItemImageProvider>(context).count.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.favorite),
              );
            },
          ),
        ),
      ),
      body: SwiperWidget(isFavorite: isFavorited),
    );
  }
}
