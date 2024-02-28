import 'package:flutter/material.dart';

class NewModalBottom extends StatelessWidget {
  Function addItem;
  NewModalBottom({
    required this.addItem,
    Key? key,
  }) : super(key: key);
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              label: Text('Name'),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
          ),
        ),
        ElevatedButton(onPressed: () => addItem(controller.text), child: Text('click here'),),
      ],),
    );
  }
}
