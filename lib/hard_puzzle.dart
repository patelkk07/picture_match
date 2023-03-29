import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picture_match/dashboard.dart';
import 'package:picture_match/hard.dart';
import 'package:picture_match/normal.dart';

class hard_puzzle extends StatefulWidget {
  int c_index;

  hard_puzzle(this.c_index);

  @override
  State<hard_puzzle> createState() => _hard_puzzleState();
}

class _hard_puzzleState extends State<hard_puzzle> {
  List img = [];
  List image1 = [];
  List<bool> temp = [];
  int a = 5, x = 1, pos1 = 0, pos2 = 0, c = 5;
  int cnt = 0;

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
        for (int i = 0; i <= c; i++) {
          await Future.delayed(
            Duration(seconds: 1),
          );
          a = i;
          if (a == c) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  contentPadding: EdgeInsets.only(top: 0),
                  titlePadding: EdgeInsets.only(top: 15, bottom: 15),
                  title: Text(
                    "TIME OUT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.teal,
                  content: Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Try Again?",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.teal,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => hard(),
                                  ),
                                );
                              },
                              child: Text("CANCLE"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.teal,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        hard_puzzle(widget.c_index),
                                  ),
                                );
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                );
              },
            );
          }
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
                  Text("${a}/${c}"),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                "Hard",
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
                        setState(() {});
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
                                              "Hard${widget.c_index}", "win");
                                          dashboard.preferences!.setInt(
                                              "hsecond${widget.c_index}", a);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => hard(),
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
