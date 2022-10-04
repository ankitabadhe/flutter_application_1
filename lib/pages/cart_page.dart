// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        title: "Cart".text.bold.color(context.primaryColor).make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal();

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return
        // SizedBox(
        //   height: 80,
        //   child:
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        VxConsumer(
            notifications: const {},
            builder: (context, _, __) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl
                  .bold
                  .color(context.primaryColor)
                  .make();
            },
            mutations: const {RemoveMutation}),
        // 30.widthBox,
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buying not supported yet".text.make()));
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.backgroundColor),
              shape: MaterialStateProperty.all(const StadiumBorder())),
          child: "Buy".text.xl.bold.white.make(),
        ).w24(context).h(40).p8()
      ],
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Nothing to show here !"
            .text
            .color(context.primaryColor)
            .xl2
            .bold
            .makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                  tileColor: context.cardColor,
                  leading: Icon(
                    Icons.done,
                    color: context.primaryColor,
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        RemoveMutation(_cart.items[index]);
                        // setState(() {});
                      },
                      icon: Icon(Icons.remove_circle_outline,
                          color: context.primaryColor)),
                  title: _cart.items[index].name.text
                      .color(context.primaryColor)
                      .bold
                      .make(),
                ).p8()),
          );
  }
}
