import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/cart_page.dart';
import 'package:flutter_application_4/pages/login_page.dart';
import 'package:flutter_application_4/providers/auth_provider.dart';
import 'package:flutter_application_4/providers/cart_provider.dart';
import 'package:flutter_application_4/widgets/carousel_slider.dart';
import 'package:flutter_application_4/widgets/home_category.dart';
import 'package:flutter_application_4/widgets/home_product_%20special.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routerName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        print(value.isAuth);
        return value.isAuth
            ? Home()
            : FutureBuilder(
                initialData: false,
                future: value.autoLogin(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return snapshot.data == true ? Home() : LoginPage();
                },
              );
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<AuthProvider>(context).checkTimeToken();
  }

  @override
  Widget build(BuildContext context) {
    void handleLogout() {
      Provider.of<AuthProvider>(context, listen: false).logout();
    }

    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              SizedBox(
                child: Image(
                  image: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Google-flutter-logo.png/799px-Google-flutter-logo.png"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                    onTap: () => handleLogout(),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("App SHop"),
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, child) {
              print(value.items.length);
              return Padding(
                padding: EdgeInsets.all(20),
                child: Badge(
                  badgeContent: Text(value.items.length.toString()),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CartPage.routerName);
                    },
                    child: Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          CarouselSliderBody(),
          SizedBox(
            height: 10,
          ),
          HomeCategory(),
          SizedBox(
            height: 10,
          ),
          HomeProductSpecial(),
        ],
      ),
    );
  }
}
