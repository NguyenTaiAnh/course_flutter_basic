import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/category_model.dart';
import 'package:flutter_application_4/pages/category_page.dart';
import 'package:flutter_application_4/providers/category_provider.dart';
import 'package:provider/provider.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  late Future dataFuture;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    dataFuture = Provider.of<CategoryProvider>(context).getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: const [],
      future: dataFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        var categoryItem = snapshot.hasData ? snapshot.data : [];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Danh mục sản phẩm",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Tất cả ( ${categoryItem.length} )"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: categoryItem.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              CategoryPage.routerName,
                              arguments: {
                                "id": categoryItem[index].id,
                                "name": categoryItem[index].name
                              },
                            );
                          },
                          child: Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(categoryItem[index].image),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(categoryItem[index].name)
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 25,
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
