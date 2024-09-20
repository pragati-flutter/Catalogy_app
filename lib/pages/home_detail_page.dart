import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';


class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key ? key, required this.catalog})
      :assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
           backgroundColor:MyTheme.creamColor,
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.xl4.bold.red800.make(),
            ElevatedButton(
              onPressed:(){} ,style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
               MyTheme.darkBluishColor,
              ),
              shape: WidgetStateProperty.all(
                StadiumBorder(),
              ),
            ),
              child: "Add to Cart".text.color(Colors.white).make(),
            ).wh(120,50),
          ],

        ),
        body: SafeArea(
          bottom: false,
           child :Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image)).h32(context).py16(),
              Expanded(
                  child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.convey,
                    edge: VxEdge.top,
                    child: Container(
                                color: Colors.white,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                catalog.name.text.xl4
            .color(MyTheme.darkBluishColor).bold.make(),
                          catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                          10.heightBox,
"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type. ".text.textStyle(context.captionStyle).make().p16(),

                        ],
                      ).py64(),
                              ),
                  ) )
            ],
          ),
        )
      );

  }
}

