import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatImg extends StatelessWidget {
  const CatImg({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .roundedSM
        .p12
        .color(context.canvasColor)
        .make()
        .p12()
        .w40(context);
  }
}
