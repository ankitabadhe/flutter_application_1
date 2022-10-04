import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/cat_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/models/cat.dart';
import '../widgets/home_widgets/cat_head.dart';
// import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catlogJson = await rootBundle.loadString("assets/files/catlog.json");

    // final response = await http.get(Uri.parse(url));
    // final catlogJson = response.body;

    final decodedData = jsonDecode(catlogJson);
    var productsData = decodedData["products"];
    CatModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
        floatingActionButton: VxBuilder(
            mutations: const {AddMutation, RemoveMutation},
            builder: (context, _, __) {
              return FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.cartRoute);
                },
                backgroundColor: context.backgroundColor,
                child: const Icon(
                  CupertinoIcons.cart,
                  color: Colors.white,
                ),
              ).badge(
                  color: Colors.white,
                  size: 23,
                  count: cart.items.length,
                  textStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold));
            }),
        backgroundColor: context.canvasColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatHeader(),
                if (CatModel.items.isNotEmpty)
                  const CatList().py12().expand()
                else
                  const CircularProgressIndicator().centered().py16().expand(),
              ],
            ),
          ),
        ));
  }
}
