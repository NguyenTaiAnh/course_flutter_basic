import 'package:app_food/config/const.dart';
import 'package:app_food/providers/CategoryProvider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("object");
    return FutureBuilder(
      future: CategoryProvider().readJson(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var categoryItem = snapshot.hasData ? snapshot.data : [];
        return snapshot.hasData
            ? GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: categoryItem.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  print(categoryItem[index]);
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/category', arguments: {
                        "title": categoryItem[index].name,
                        "category_id": categoryItem[index].id
                      });
                    },
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(categoryItem[index].image),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              categoryItem[index].name,
                              style: textStyleCustom,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })
            : const Center(
                child: Text("not data"),
              );
      },
    );
  }
}
