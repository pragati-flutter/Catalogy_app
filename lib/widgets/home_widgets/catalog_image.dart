import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/themes.dart';

class CatalogImage extends StatelessWidget{
  final String image;

  const CatalogImage({Key ?key ,required this.image})
      : assert(image != null),super(key: key);


  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p16.color(MyTheme.creamColor).make().p16();

  }
}