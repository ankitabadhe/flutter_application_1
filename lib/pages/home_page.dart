// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:convert';
import '../models/cat.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // @override
  // void initState() {
  //   initState();
  //   loadData();
  // }

  // loadData() async {
  //   final catlogJson = await rootBundle.loadString("assets/files/catlog.json");
  //   final decodedData = jsonDecode(catlogJson);
  //   var productsData = decodedData["products"];
  //   // ignore: avoid_print
  //   print(productsData);
  // }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => CatModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
