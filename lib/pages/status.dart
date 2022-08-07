import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);
  static var routeName = "/status";

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  var title = "Status";
  var fadeState = CrossFadeState.showFirst;
  late var appBar = unScrolledAppBar();
  late Size size;

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar,
      body: ListView(
        controller: scrollController,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text(
              "Status",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const CupertinoSearchTextField(),
          ),
          const SizedBox(height: 20),
          myStatus(),
          // const Divider(),
        ],
      ),
    );
  }

  unScrolledAppBar() {
    return AppBar(
      leading: CupertinoButton(
        child: const Text("Privacy"),
        onPressed: () {},
      ),
      leadingWidth: 90,
      title: AnimatedCrossFade(
        sizeCurve: Curves.fastOutSlowIn,
        firstChild: Container(),
        secondChild: Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        crossFadeState: fadeState,
        secondCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 200),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.offset > 100) {
        setState(() {
          fadeState = CrossFadeState.showSecond;
        });
      } else {
        setState(() {
          fadeState = fadeState = CrossFadeState.showFirst;
        });
      }
    });
  }

  myStatus() {
    return Material(
      child: ListTile(
        leading: CircleAvatar(),
        title: Text("My Status"),
        subtitle: Text("2h ago"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              borderRadius: BorderRadius.circular(100),
              // color: Colors.red,
              child: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.camera_fill),
              ),
            ),
            const SizedBox(width: 20),
            Material(
              borderRadius: BorderRadius.circular(100),
              // color: Colors.red,
              child: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.pencil),
              ),
            )
          ],
        ),
        onTap: () {},
      ),
    );
  }

  myStatus2() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              width: size.width * 0.14,
              height: size.height * 0.06,
              padding: const EdgeInsets.all(4),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black,
                  ),
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
}
