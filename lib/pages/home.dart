import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/chats.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static var routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [
    const Chats(),
    const Chats(),
    const Chats(),
    const Chats(),
  ];
  var currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: 3,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 12,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Status",
            icon: Builder(builder: (context) {
              if (currentIndex == 0) {
                return const Icon(CupertinoIcons.circle_grid_hex_fill);
              } else {
                return const Icon(CupertinoIcons.circle_grid_hex);
              }
            }),
          ),
          BottomNavigationBarItem(
            label: "Calls",
            icon: Builder(builder: (context) {
              if (currentIndex == 1) {
                return const Icon(CupertinoIcons.phone_fill);
              } else {
                return const Icon(CupertinoIcons.phone);
              }
            }),
          ),
          BottomNavigationBarItem(
            label: "Camera",
            icon: Builder(builder: (context) {
              if (currentIndex == 2) {
                return Icon(CupertinoIcons.camera_fill);
              } else {
                return Icon(CupertinoIcons.camera);
              }
            }),
          ),
          BottomNavigationBarItem(
            label: "Chats",
            icon: Badge(
              badgeContent: const Text(
                "10",
                style: TextStyle(color: Colors.white),
              ),
              position: BadgePosition.topEnd(top: -5, end: -14),
              child: Builder(builder: (context) {
                if (currentIndex == 3) {
                  return const Icon(CupertinoIcons.chat_bubble_2_fill);
                } else {
                  return const Icon(CupertinoIcons.chat_bubble_2);
                }
              }),
            ),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Builder(builder: (context) {
              if (currentIndex == 4) {
                return Icon(CupertinoIcons.settings_solid);
              } else {
                return Icon(CupertinoIcons.settings);
              }
            }),
          )
        ],
        onTap: (index) {
          print(index);
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
