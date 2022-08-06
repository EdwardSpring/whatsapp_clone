import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);
  static var routeName = "/chats";

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: <Widget>[
              Icon(
                Icons.person,
                size: 40,
              )
            ],
            title: Text("Slive"),
            leading: CupertinoButton(child: Text("Edit"), onPressed: () {}),
            expandedHeight: 100.0,
            floating: true,
            pinned: true,
          )
        ],
      ),
    );
  }
}
