import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/models/cat.dart';

class HomeDetailPage extends StatelessWidget {
  final Item cat;
  const HomeDetailPage({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              cat.price.text.xl.red700.bold.make(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.cartRoute);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.darkBluishColor),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
                child: "Add to Cart".text.xl.make(),
              ).w40(context)
            ]).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(cat.id.toString()),
              child: Image.network(cat.image),
            ).h40(context),
            Expanded(
              child: VxArc(
                height: 20.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      cat.name.text.xl2
                          .color(MyTheme.darkBluishColor)
                          .bold
                          .make(),
                      cat.desc.text.xl.textStyle(context.captionStyle).make(),
                      30.heightBox,
                      "The oer not mien my no nothing door lonely on, the that sent it whom and some as eagerly. Above.Soul back see into never one that and, late some burning all that till fact whispered ungainly, with shadow entrance."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                    ],
                  ).p32(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
