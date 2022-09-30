// ignore_for_file: override_on_non_overriding_member

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
// import 'dart:convert';
import '../models/cat.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catlogJson = await rootBundle.loadString("assets/files/catlog.json");
    final decodedData = jsonDecode(catlogJson);
    var productsData = decodedData["products"];
    CatModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: (CatModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: CatModel.items.length,
                itemBuilder: (context, index) => ItemWidget(
                  item: CatModel.items[index],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
