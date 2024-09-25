

import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/core.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl.make(),
      ),
      body: Column(
        children: [
           const CartList().p32().expand(),
          const Divider(),
          const CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
   const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         VxConsumer(
           notifications: {},
           mutations: const {RemoveMutation},

         builder:(context,store,status){
           return "\$${cart.totalPrice}".text.xl5.color(Theme.of(context).colorScheme.secondary).make();

         }
         ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet".text.make()));
            },
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.secondary)),
            child: "Buy".text.color(context.canvasColor).make(),
          ).w32(context)
        ],
      ),
    );
  }
}
class CartList extends StatelessWidget {


  const CartList({super.key});


  @override
  Widget build(BuildContext context) {

       return VxBuilder(
      mutations: const {RemoveMutation},
        builder: (context,store,status){
          final CartModel cart = (VxState.store as MyStore).cart;

          return cart.items.isEmpty ? "Nothing to show".text.xl3.makeCentered():ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) =>
                ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      RemoveMutation(cart.items[index]!);
                    },
                  ),
                  title: cart.items[index]?.name.text.make(),
                ),
          );
        }

    );
  }
}
