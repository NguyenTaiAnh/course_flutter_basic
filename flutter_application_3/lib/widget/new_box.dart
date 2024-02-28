import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class NewBox extends StatelessWidget {
  final item;
  final indexItem;
  Function deleteItem;
  NewBox({
    Key? key,
    this.item,
    this.indexItem,
    required this.deleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical:10),
    padding: EdgeInsets.all(20),
    width: double.infinity,
    height: 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: (indexItem % 2 == 0) ? Colors.amber  : Colors.blueAccent,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(item.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
      
      InkWell(
        child: Icon(Icons.delete,color: Colors.white,),
        onTap: () async{
          if (await confirm(context)) {
              this.deleteItem(item.id);
            }
            return;
        },
        ),
    ],),
          );
  }
}