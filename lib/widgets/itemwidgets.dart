// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../models/cat.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.black,

      // shape: const StadiumBorder(),
      child: ListTile(
        // horizontalTitleGap: 30,
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(item.image, width: 60),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 0.9,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
// TODO Implement this library.