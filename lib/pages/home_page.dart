import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter/services.dart';
import 'dart:convert';



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
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:(CatalogModel.items!= null &&  CatalogModel.items.isNotEmpty)? ListView.builder(
            itemCount:CatalogModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: CatalogModel.items[index],
              );
            }
            ):Center(
          child: CircularProgressIndicator(),
        ),
      ),





      drawer: Drawer(
        width: 260,
        child: Container(
          color: Colors.deepPurple.shade200,
          child: ListView(
            children: [
              DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: UserAccountsDrawerHeader(
                      accountName: const Text("Pragati Mishra"),
                      accountEmail: const Text("example@gmail.com"),
                      currentAccountPicture: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(imageUrl),
                      ))),
              const ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  // textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  // textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                ),
                title: Text(
                  "Email me",
                  // textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
