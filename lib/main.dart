import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/home.dart';
import 'package:whatsapp_clone/utility/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      home: const Home(),
    );
  }
}
