 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_catalog/widgets/drawer.dart';
 class HomePage extends StatelessWidget {

   String name = "CodeVilla";
   String Imageurl = "https://imgs.search.brave.com/UYlCmhqmyUMmckNx0phhbSOvEPfWxaciY35TtKs2Hqo/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/cGl4YWJheS5jb20v/cGhvdG8vMjAyMC8w/My8yNi8wOS8wOC9n/aXJsLTQ5Njk2OTBf/NjQwLmpwZw";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to day $name"),
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


          accountName: Text("Pragati Mishra"),
          accountEmail: Text("example@gmail.com"),
          currentAccountPicture: CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(Imageurl),
          )
        )
        ),

        ListTile(
          leading: Icon(
            CupertinoIcons.home,
            color: Colors.white,
          ),
          title: Text(
            "Home",
            textScaleFactor: 1.2,
            style: TextStyle(
              color: Colors.white
            ),

          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.profile_circled,
            color: Colors.white,
          ),
          title: Text(
            "Profile",
            textScaleFactor: 1.2,
            style: TextStyle(

              color: Colors.white
            ),

          ),
        ),

        ListTile(
          leading: Icon(
            CupertinoIcons.mail,
            color: Colors.white,

          ),
          title: Text(
            "Email me",
            textScaleFactor: 1.2,
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
