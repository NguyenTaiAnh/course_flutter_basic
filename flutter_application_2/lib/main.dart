import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/items.dart';
import 'package:flutter_application_2/providers/itemprovider.dart';
import 'package:flutter_application_2/widgets/body_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (_) => ItemProver(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My App",
        home: AppFavorite(),
      ),
    );
  }
}

enum FillterItem { all, favorite }

class AppFavorite extends StatefulWidget {
  const AppFavorite({super.key});

  @override
  State<AppFavorite> createState() => _AppFavoriteState();
}

class _AppFavoriteState extends State<AppFavorite> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ItemProver>(context, listen: false).readJson();
  }

  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    List<Items> items = Provider.of<ItemProver>(context, listen: false).items;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.yellow, Colors.green, Colors.blue],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
        ),
        title: Text("Favorite Images"),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_horiz),
              onSelected: (value) {
                setState(() {
                  if (value == FillterItem.all) {
                    this.isValid = false;
                  } else {
                    this.isValid = true;
                  }
                });
                print(value);
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text("All"),
                      value: FillterItem.all,
                    ),
                    PopupMenuItem(
                      value: FillterItem.favorite,
                      child: Text("Favorites"),
                    ),
                  ])
        ],
        leading: Padding(
          padding: EdgeInsets.all(14),
          child: Badge(
            badgeContent: Text(
              Provider.of<ItemProver>(context).count.toString(),
              style: TextStyle(color: Colors.white),
            ),
            child: Icon(Icons.favorite),
          ),
        ),
      ),
      body: BodyWidget(isValid: isValid),
    );
  }
}
