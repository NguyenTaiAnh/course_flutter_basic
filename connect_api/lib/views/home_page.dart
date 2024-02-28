import 'package:connect_api/models/stories.dart';
import 'package:connect_api/services/api_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item>? stories;
  // List<Data>? stories;

  var isLoading = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    stories = await ApiService().getStories();
    // ignore: unnecessary_cast
    if (stories != null) {
      setState(() {
        isLoading = true;
      });
    } else {
      debugPrint("hello");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stories")),
      body: Visibility(
        visible: isLoading,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: stories?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(stories![index].name),
                leading: Image.network(stories![index].image),
                onTap: () {
                  // debugPrint(stories![index].id.toString());
                  // Navigator.of(context).pushNamed('$DetailStory');
                },
              );
            }),
      ),
    );
  }
}
