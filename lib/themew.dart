import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class Mytheme {
  static ThemeData lighttheme(BuildContext context) =>
      ThemeData(


          canvasColor: creamColor,
          cardColor: Colors.white,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.white),


          ));

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(

          brightness: Brightness.dark,
          cardColor: Colors.black,
          canvasColor: darkcreamColor,
          hintColor: Colors.white,
          appBarTheme: const AppBarTheme(
            color: Colors.black,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),

          ));

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;




}