import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_application_1/widgets/home_widgets/cat_img.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/models/cat.dart';

class CatItem extends StatelessWidget {
  final Item cat;
  const CatItem({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(children: [
      Hero(
        tag: Key(cat.id.toString()),
        child: CatImg(
          image: cat.image,
        ),
      ),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          cat.name.text.color(context.primaryColor).xl.bold.make(),
          cat.desc.text
              .color(context.primaryColor)
              .textStyle(context.captionStyle)
              .make(),
          "\$${cat.price}".text.color(context.primaryColor).bold.make(),
          10.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            buttonPadding: EdgeInsets.zero,
            children: [AddToCart(cat: cat)],
          ).pOnly(left: 30.0)
        ],
      ))
    ])).color(context.cardColor).roundedSM.square(150).make().py12();
  }
}
