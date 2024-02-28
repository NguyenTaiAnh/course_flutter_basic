import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/model/items.dart';
import 'package:flutter_application_3/widget/new_box.dart';
import 'package:flutter_application_3/widget/new_modal_bottom.dart';

void  main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: HomePage(),
    );
  }

}
class HomePage extends StatefulWidget{
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DataItems> items = [];

  void handleAdd(String name){
    var item = DataItems(id: DateTime.now().toString(), name: name);
    print(item.name);
    if(name.isEmpty){
      return;
    }
    setState(() {
      items.add(item);
      Navigator.pop(context);
    });
  }

  void handleDelete(String id){
    setState(() {
      items.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: items.map((item) => NewBox(item: item, deleteItem: handleDelete, indexItem: items.indexOf(item))).toList()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context, builder: (BuildContext context){
          
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: NewModalBottom(addItem: handleAdd),
          );
        }
        );
      },
      child: Icon(Icons.add)),
    );
  }
}


