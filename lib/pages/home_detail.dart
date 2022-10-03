import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
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
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        padding: EdgeInsets.zero,
        color: context.cardColor,
        child: ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            buttonPadding: EdgeInsets.zero,
            children: [
              cat.price.text
                  .color(context.primaryColor)
                  .xl
                  .bold
                  .make()
                  .pOnly(right: 90.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.cartRoute);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(context.backgroundColor),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
                child: "Add to Cart".text.bold.color(Colors.white).make(),
              ).pOnly(left: 20.0)
            ]).p24(),
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
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      cat.name.text.xl2
                          .color(context.primaryColor)
                          .bold
                          .make()
                          .p4(),
                      cat.desc.text.center.xl
                          .textStyle(context.captionStyle)
                          .color(context.primaryColor)
                          .make(),
                      20.heightBox,
                      "The oer not mien my no nothing door lonely on, the that sent it whom and some as eagerly. Above.Soul back see into never one that and, late some burning all that till fact whispered ungainly, with shadow entrance."
                          .text
                          .center
                          .color(context.primaryColor)
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
