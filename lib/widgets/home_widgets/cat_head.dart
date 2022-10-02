import 'package:flutter/material.dart';
// import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatHeader extends StatelessWidget {
  const CatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.color(context.primaryColor).xl5.bold.make(),
        "Trending Products".text.color(context.primaryColor).xl.make(),
        19.heightBox,
      ],
    );
  }
}
