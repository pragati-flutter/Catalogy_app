import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';


class MyTheme{
static ThemeData  LightTheme(BuildContext) => ThemeData(
  fontFamily: GoogleFonts.poppins().fontFamily,
  cardColor: Colors.white,
  canvasColor:creamColor ,
  colorScheme: ColorScheme.light(
    primary:darkBluishColor,
    secondary:darkBluishColor,

  ),


  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),

  ),
);

static ThemeData darkTheme(context)=> ThemeData(


  fontFamily: GoogleFonts.poppins().fontFamily,
  cardColor: Colors.black,
  canvasColor: darkCreamColor,
  colorScheme: ColorScheme.light(
    primary:lightBlueColor,
    secondary:Colors.white,
  ),

  appBarTheme: AppBarTheme(
    color: Colors.white,

    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white),

  ),


);
static Color creamColor = Color(0xfff5f5f5);
static Color darkBluishColor = Color(0xff403b58);
static Color darkCreamColor = Vx.gray900;
static Color lightBlueColor = Vx.indigo500;


}


