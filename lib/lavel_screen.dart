import 'package:flutter/material.dart';
import 'package:picture_match/dashboard.dart';
import 'package:picture_match/gameplay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class lavel_screen extends StatefulWidget {
  // int a;
  // lavel_screen(this.a);

  @override
  State<lavel_screen> createState() => _lavel_screenState();
}

class _lavel_screenState extends State<lavel_screen> {
  List l_name = [
    "MATCH 2",
    "MATCH 3",
    "MIRROR",
    "MIRROR 3",
    "MATCH 4",
    "MIRROR 4",
  ];

  List leval = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leval = List.filled(60, "Panding");
    for (int i = 0; i < 60; i++) {
      leval[i] = dashboard.preferences!.getString("levelno${i}") ?? "Panding";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Leval",
          style: TextStyle(
            color: Colors.grey[200],
          ),
        ),
        backgroundColor: Colors.teal,
        actions: [
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
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal[50],
                image: DecorationImage(
                  // fit: BoxFit.fill,
                  image: AssetImage("img/dashimg.png"),
                ),
              ),
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, myindex) {
                  return Container(
                    width: 220,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.teal[50],
                      border: Border.all(
                        color: Colors.teal,
                        width: 3,
                      ),
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "${l_name[myindex]}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.teal,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.question_mark,
                                    size: 18,
                                    color: Colors.teal,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1.5,
                              color: Colors.teal,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => gameplay(
                                            (myindex * 10) + index + 1),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    height: 50,
                                    // width: 160,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          (leval[(myindex * 10) + index + 1] ==
                                                  "win")
                                              ? Colors.teal
                                              : Colors.teal[100],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3),
                                      ),
                                    ),
                                    child: Text(
                                      (leval[(myindex * 10) + index + 1] ==
                                              "win")
                                          ? "LEVEL ${(myindex * 10) + index + 1} - ${dashboard.preferences!.getInt("second${(myindex * 10) + index + 1}")}"
                                          : "LEVEL ${(myindex * 10) + index + 1}",
                                      style: TextStyle(
                                        color: Colors.grey[200],
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
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
