import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {


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
          CartList().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl5.color(Theme.of(context).colorScheme.secondary).make(),
      30.widthBox,
      ElevatedButton(onPressed:(){
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar
          (content: "Buying not supported yet".text.make())
        );
      } ,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                 Theme.of(context).colorScheme.secondary)
              ),

              child:"Buy".text.color(context.canvasColor).make(),
          ).w32(context)
        ],
      ),
    );
  }
}


class CartList extends StatefulWidget {
  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
itemCount: 5,
        itemBuilder:(context,index)=>ListTile(
      leading: Icon(Icons.done),
      trailing: IconButton(
          icon:Icon(Icons.remove_circle_outline),
      onPressed: (){

      },
      ),
          title: "Item 1".text.make(),
        ),
    );
  }
}
