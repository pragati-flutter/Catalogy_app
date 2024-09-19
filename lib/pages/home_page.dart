import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "CodeVilla";

  final String imageUrl =
      "https://imgs.search.brave.com/UYlCmhqmyUMmckNx0phhbSOvEPfWxaciY35TtKs2Hvar fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/cGl4YWJheS5jb20v/cGhvdG8vMjAyMC8w/My8yNi8wOS8wOC9n/aXJsLTQ5Njk2OTBf/NjQwLmpwZw";

  void initState() {
    super.initState();
    loadData();
  }


  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    final catalogJson =
    await rootBundle.loadString("files/catalog.Json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData).map<Item>((item) {
      return Item.fromMap(item);
    }).toList();
    setState(() {

     });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CatalogHeader(),

        if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
         CatalogList().expand()
        else

             CircularProgressIndicator().centered().expand(),
          
      ],
          ),
        ),
      ),
    );

  }

  }



