import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/core.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCard extends StatelessWidget {
  final Item catalog;

  const AddToCard({super.key, required this.catalog});






  @override
  Widget build(BuildContext context) {





    return VxBuilder(
      mutations: const {AddMutation,RemoveMutation},
        builder: (context,store,status) {
          final CartModel cart = (VxState.store as MyStore).cart;
          bool isInCart = cart.items.contains(catalog);

          return
           ElevatedButton(
          onPressed: () {
          if (!isInCart) {
          AddMutation(catalog);
          }
          },
          style: ElevatedButton.styleFrom(
          backgroundColor: context.primaryColor,
          shape: const StadiumBorder(),
          ),
          child: isInCart ? const Icon(Icons.done ,color:Colors.white ): "Add to cart".text.color(context.canvasColor).make(),
          );
          }
    );
  }
}
