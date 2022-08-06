import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utility/colors.dart';

class CustomThemeData {
  static var light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      backgroundColor: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(color: iconColor),
    ),
  );

  static var dark = ThemeData();
}
