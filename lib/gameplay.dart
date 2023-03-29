import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picture_match/dashboard.dart';
import 'package:picture_match/lavel_screen.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class gameplay extends StatefulWidget {
  int c_index;

  gameplay(this.c_index);

  @override
  State<gameplay> createState() => _gameplayState();
}

class _gameplayState extends State<gameplay> {
  List img = [];
  List image1 = [];
  List<bool> temp = [];
  int a = 5, x = 1, pos1 = 0, pos2 = 0;
  int cnt = 0;

  StopWatchTimer? stopWatchTimer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initImages();
    get();
    temp = List.filled(12, true);
    setState(() {});
  }

  Future _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('images/'))
        .where((String key) => key.contains('.png'))
        .toList();

    setState(() {
      img = imagePaths;
      img.shuffle();
      for (int i = 0; i < 6; i++) {
        image1.add(img[i]);
        image1.add(img[i]);
      }
      image1.shuffle();
    });
  }

  get() async {
    for (int i = 5; i >= 0; i--) {
      await Future.delayed(
        Duration(seconds: 1),
      );
      a = i;

      if (i == 0) temp = List.filled(12, false);
      if (i == 0) {
        for (int i = 0; i < double.infinity; i++) {
          await Future.delayed(
            Duration(seconds: 1),
          );
          a = i;
          setState(() {});
        }
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Text("Time: "),
                  Text("${a}/0"),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                "NO TIME LIMIT",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.volume_up,
            ),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Share"),
                ),
                PopupMenuItem(
                  child: Text("More Games"),
                ),
                PopupMenuItem(
                  child: Text("Privacy Policy"),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: image1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (!temp[index] && x == 1) {
                      temp[index] = true;
                      x = 2;
                      pos1 = index;
                      setState(() {});
                    }
                    if (!temp[index] && x == 2) {
                      temp[index] = true;
                      x = 1;
                      pos2 = index;

                      if (image1[pos1] == image1[pos2]) {
                        print("picture match");
                        cnt++;
                        if (cnt == 6) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                contentPadding: EdgeInsets.only(top: 0),
                                titlePadding:
                                    EdgeInsets.only(top: 15, bottom: 15),
                                title: Text(
                                  "NEW RECORD!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Colors.teal,
                                content: Container(
                                  width: double.infinity,
                                  height: 170,
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "${a} SECONDS",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "NO TIME LIMIT",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "LEVEL ${widget.c_index}",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "WELL DONE!",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.teal,
                                        ),
                                        onPressed: () {
                                          dashboard.preferences!.setString(
                                              "levelno${widget.c_index}",
                                              "win");
                                          dashboard.preferences!.setInt(
                                              "second${widget.c_index}", a);
                                          dashboard.preferences!.setInt(
                                              "index",
                                              widget.c_index);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  lavel_screen(),
                                            ),
                                          );
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      } else {
                        Future.delayed(
                          Duration(milliseconds: 400),
                        ).then((value) {
                          temp[pos1] = false;
                          temp[pos2] = false;
                          setState(() {});
                        });
                      }

                      setState(() {});
                    }
                  },
                  child: Visibility(
                    child: Container(
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      height: 100,
                      width: 100,
                      //  color: Colors.red,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Image.asset(
                          "${image1[index]}",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    visible: temp[index],
                    replacement: Container(
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      height: 100,
                      width: 100,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 80,
            color: Colors.teal,
          ),
        ],
      ),
    );
  }
}
