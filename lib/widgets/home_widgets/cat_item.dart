import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_widgets/cat_img.dart';
import 'package:flutter_application_1/widgets/themes.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cat.name.text.xl.color(MyTheme.darkBluishColor).bold.make(),
          cat.desc.text.textStyle(context.captionStyle).make(),
          10.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              cat.price.text.xl.bold.make(),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.darkBluishColor),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
                child: "BUY".text.make(),
              ),
            ],
          ).pOnly(right: 9.0)
        ],
      ))
    ])).white.roundedSM.square(150).make().py12();
  }
}
