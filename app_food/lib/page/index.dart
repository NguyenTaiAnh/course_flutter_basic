import 'package:app_food/config/const.dart';
import 'package:app_food/page/favorite/favorite.dart';
import 'package:app_food/page/home/home.dart';
import 'package:app_food/page/seen/Seen.dart';
import 'package:app_food/providers/ProductProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppFood extends StatefulWidget {
  const AppFood({super.key});
  static const routeName = '/';

  @override
  State<AppFood> createState() => _AppFoodState();
}

class _AppFoodState extends State<AppFood> {
  int _selectedIndex = 0;
  late Future _dataFuture;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _dataFuture = Provider.of<ProductProvider>(context).readJson();
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavoritePage(),
    SeenPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Food'),
        backgroundColor: themeCustom,
      ),
      body: FutureBuilder(
        future: _dataFuture,
        builder: (context, snapshot) {
          return Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse_sharp),
            label: 'Seen',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        backgroundColor: themeCustom,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
