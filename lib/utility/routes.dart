import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/home.dart';

class Routes {
  static var routes = <String, WidgetBuilder>{
    Home.routeName: (context) => const Home(),
  };
}
