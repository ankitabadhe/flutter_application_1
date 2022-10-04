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
    final CartModel cart = (VxState.store as MyStore).cart;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        VxConsumer(
            notifications: const {},
            builder: (context, _, __) {
              return "\$${cart.totalPrice}"
                  .text
                  .xl
                  .bold
                  .color(context.primaryColor)
                  .make();
            },
            mutations: const {RemoveMutation}),
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
    final CartModel cart = (VxState.store as MyStore).cart;

    return cart.items.isEmpty
        ? "Nothing to show here !"
            .text
            .color(context.primaryColor)
            .xl2
            .bold
            .makeCentered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                  tileColor: context.cardColor,
                  leading: Icon(
                    Icons.done,
                    color: context.primaryColor,
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        RemoveMutation(cart.items[index]);
                      },
                      icon: Icon(Icons.remove_circle_outline,
                          color: context.primaryColor)),
                  title: cart.items[index].name.text
                      .color(context.primaryColor)
                      .bold
                      .make(),
                ).p8()),
          );
  }
}
