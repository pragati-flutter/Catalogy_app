import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/util/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import 'package:velocity_x/velocity_x.dart';

import 'core/core.dart';


void main() {

  runApp(VxState(
      store: MyStore()  , child: const MyApp()));
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.cartRoute:(context)=>const CartPage(),
      },
    );
  }
}
