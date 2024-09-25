import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';

import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(catalog: catalog),
              ),
            ),
            child: CatalogItem(catalog: catalog),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(
                image: catalog.image,
              )).w40(context),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg
                    .color(Theme.of(context).colorScheme.secondary)
                    .bold
                    .make(),
                catalog.desc.text
                    .textStyle(context.captionStyle)
                    .color(Theme.of(context).colorScheme.secondary)
                    .make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}"
                        .text
                        .xl
                        .bold
                        .color(Theme.of(context).colorScheme.secondary)
                        .make(),
                    AddToCard(catalog: catalog),
                  ],
                ).pOnly(right: 8.0)
              ],
            ).py1(),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(170).make().py16();
  }
}

