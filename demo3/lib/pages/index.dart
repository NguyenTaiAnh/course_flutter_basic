import 'package:demo3/config/const.dart';
import 'package:demo3/pages/favotite/favorite_body.dart';
import 'package:demo3/pages/home/home_body.dart';
import 'package:demo3/pages/seen/seen_body.dart';
import 'package:demo3/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  static const routeName = '/';
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  late Future _dataFuture;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _dataFuture = Provider.of<ProductProvider>(context).readJson();
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeBody(),
    const FavoriteBody(),
    const SeenBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _dataFuture,
        builder: (BuildContext content, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Good Food'),
              backgroundColor: dColorMain,
            ),
            body: _widgetOptions[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
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
              onTap: _onItemTapped,
              backgroundColor: dColorMain,
              iconSize: sizeIconButton,
              unselectedItemColor: dColorIconButtonInactive,
              selectedItemColor: dColorIconButtonActive,
            ),
          );
        });
  }
}
