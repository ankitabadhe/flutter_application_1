import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/cat_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/models/cat.dart';
//import 'package:flutter_application_1/widgets/themes.dart';
import '../widgets/home_widgets/cat_head.dart';

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: context.backgroundColor,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ),
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
