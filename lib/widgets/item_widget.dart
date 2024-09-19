import 'package:flutter/material.dart';

import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: Image.network(item.image),
          title: Text(item.name ),
          subtitle: Text(item.desc ),

          trailing: Text("\$${item.price}",style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),),
        ),

      ),
    );
  }
}
