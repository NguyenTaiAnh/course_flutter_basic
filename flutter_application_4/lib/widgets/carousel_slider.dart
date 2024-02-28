import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/providers/carousel_slider_provider.dart';
import 'package:provider/provider.dart';

class CarouselSliderBody extends StatefulWidget {
  const CarouselSliderBody({super.key});

  @override
  State<CarouselSliderBody> createState() => _CarouselSliderBodyState();
}

class _CarouselSliderBodyState extends State<CarouselSliderBody> {
  late Future futureData;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    futureData = Provider.of<CarouselSliderProvider>(context).listData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: FutureBuilder(
        initialData: const [],
        future: futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // var sliderData = [];
          // if (snapshot.hasData) {
          //   sliderData = snapshot.data! as List;
          // } else {
          //   return Container(
          //     child: Text(snapshot.error.toString()),
          //   );
          // }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          var carouselItem = snapshot.hasData ? snapshot.data as List : [];
          return snapshot.hasData
              ? CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 1),
                    // autoPlayAnimationDuration: Duration(milliseconds: 500),
                  ),
                  items: carouselItem.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(i.image),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                )
              : Container(
                  child: Text(snapshot.error.toString()),
                );
        },
      ),
    );
  }
}
