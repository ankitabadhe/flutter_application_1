import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
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
        .color(MyTheme.creamColor)
        .make()
        .p12()
        .w40(context);
  }
}
