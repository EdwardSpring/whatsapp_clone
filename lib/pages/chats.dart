import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);
  static var routeName = "/chats";

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  var title = "Chats";
  var fadeState = CrossFadeState.showFirst;
  late var appBar = unScrolledAppBar();

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // appBar = unScrolledAppBar();
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          controller: scrollController,
          children: [
            const Text(
              "Chats",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const CupertinoSearchTextField(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text("Broadcast Lists"),
                  onPressed: () {},
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text("New Group"),
                  onPressed: () {},
                )
              ],
            ),
            const Divider(),
            archiveTile(size),
            chatTile(size),
            chatTile(size),
            chatTile(size),
            chatTile(size),
            chatTile(size),
            chatTile(size),
            chatTile(size),
            chatTile(size),
          ],
        ),
      ),
    );
  }

  scrolledAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[100],
      leading: CupertinoButton(
        child: const Text("Edit"),
        onPressed: () {},
      ),
      leadingWidth: 70,
      actions: <Widget>[
        CupertinoButton(
          child: const Icon(CupertinoIcons.pencil_ellipsis_rectangle),
          onPressed: () {},
        ),
        // const SizedBox(width: 15),
      ],
      title: AnimatedCrossFade(
        sizeCurve: Curves.fastOutSlowIn,
        firstChild: Container(),
        secondChild: Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        crossFadeState: fadeState,
        secondCurve: Curves.easeIn,
        duration: Duration(milliseconds: 200),
      ),
    );
  }

  unScrolledAppBar() {
    return AppBar(
      leading: CupertinoButton(
        child: const Text("Edit"),
        onPressed: () {},
      ),
      leadingWidth: 70,
      actions: <Widget>[
        CupertinoButton(
          child: const Icon(CupertinoIcons.pencil_ellipsis_rectangle),
          onPressed: () {},
        ),
        // const SizedBox(width: 15),
      ],
      title: AnimatedCrossFade(
        sizeCurve: Curves.fastOutSlowIn,
        firstChild: Container(),
        secondChild: Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        crossFadeState: fadeState,
        secondCurve: Curves.easeIn,
        duration: Duration(milliseconds: 200),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(() {
      if (scrollController.offset > 90) {
        // pinChatsText = false;
        setState(() {
          fadeState = CrossFadeState.showSecond;
          appBar = scrolledAppBar();
        });
      } else {
        setState(() {
          fadeState = CrossFadeState.showFirst;
          appBar = unScrolledAppBar();
        });
      }
    });
  }

  archiveTile(size) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.14,
              child: Align(
                alignment: Alignment.center,
                child: const Icon(
                  CupertinoIcons.archivebox_fill,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              padding: EdgeInsets.only(bottom: 10),
              width: size.width * 0.7,
              height: size.height * 0.043,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color.fromARGB(90, 158, 158, 158)),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Archived",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "11",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  chatTile(size) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            minRadius: 30,
            backgroundImage: NetworkImage(
              "https://ichef.bbci.co.uk/news/976/cpsprodpb/18357/production/_121995199_gettyimages-1172292629.jpg",
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.only(bottom: 15),
            width: size.width * 0.7,
            height: size.height * 0.09,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color.fromARGB(90, 158, 158, 158)),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Michael",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "00:31",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.check,
                      color: Colors.grey,
                      size: 20,
                    ),
                    Text("data"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
