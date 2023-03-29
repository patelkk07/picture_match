import 'package:flutter/material.dart';
import 'package:picture_match/hard.dart';
import 'package:picture_match/lavel_screen.dart';
import 'package:picture_match/normal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  static SharedPreferences? preferences;

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  // List l_index = [];
  // int a = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_pref();
    // l_index = List.filled(l_index.length, 0);
    // for (int i = 0; i < l_index.length; i++) {
    //   l_index[i] = dashboard.preferences!.getInt("index${i}") ?? 0;
    //   a = i;
    //   setState(() {});
    // }
  }

  get_pref() async {
    dashboard.preferences = await SharedPreferences.getInstance();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Mode",
          style: TextStyle(
            color: Colors.grey[200],
          ),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => lavel_screen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 55,
                            width: 160,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.all(
                                Radius.circular(3),
                              ),
                            ),
                            child: Text(
                              "NO TIME LIMET",
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => normal(),
                              ),
                            );
                          },
                          child: Container(
                            height: 55,
                            width: 160,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.all(
                                Radius.circular(3),
                              ),
                            ),
                            child: Text(
                              "NORMAL",
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => hard(),
                              ),
                            );
                          },
                          child: Container(
                            height: 55,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.all(
                                Radius.circular(3),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "HARD",
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // height: 211,
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
                    child: Container(
                      height: 40,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),
                        ),
                      ),
                      child: Text(
                        "REMOVE ADS",
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: 280,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.all(
                              Radius.circular(3),
                            ),
                          ),
                          child: Text(
                            "SHARE",
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.all(
                              Radius.circular(3),
                            ),
                          ),
                          child: Text(
                            "MORE GAMES",
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
