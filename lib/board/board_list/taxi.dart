import 'dart:convert';

import 'package:every/board/add_post.dart';
import 'package:every/board/board_list.dart';
import 'package:every/chatting/chat.dart';
import 'package:every/chatting/chat_list.dart';
import 'package:every/chatting/chat_message.dart';
import 'package:every/loggin/log.dart';
import 'package:every/loggin/sign_up.dart';
import 'package:every/style.dart';
import 'package:every/board/write_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:every/chatting/chat_list.dart';
import 'package:every/ALERT/alert.dart';
import 'package:every/home/home.dart';
import 'package:every/setting/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class taxi extends StatefulWidget {
  const taxi({super.key});

  @override
  State<taxi> createState() => _taxi();
}

class _taxi extends State<taxi> {
  late Map<int, Color> heart_color = new Map();
  var num;
  var count;
  var check;
  var tmp;

  List<String> post = new List.empty(growable: true);
  List<String> post1 = new List.empty(growable: true);

  final ScrollController _scrollController = ScrollController();

  @override
  checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    num = prefs.getString('num');
  }

  void initState() {
    count = 0;
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        scrollListener();
      }
    });
    checkToken();
    for (int i = 0; i <= 199; i++) {
      heart_color[i] = Colors.grey;
    }
    scrollListener();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future scrollListener() async {
    Map data = {
      "num": num,
      "board": "택시 탈 사람?",
      "count": count,
    };
    var body = jsonEncode(data);
    Map<String, String> headers = {
      "Accept": "application/json",
      "content-type": "application/json",
    };
    http.Response _res = await http.post(
        Uri.parse(dotenv.get('BASE_URL') + "board_list"),
        headers: headers,
        body: body);
    List<dynamic> list = jsonDecode(_res.body);
    if (_res.statusCode == 200) {
      for (int i = 0; i < 10; i++) {
        setState(() {
          post.add(list[i]['title']);
          post1.add(list[i]['contents']);
          count++;
        });
      }
    }
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
          color: Colors.white,
          width: Width_size,
          height: Height_size,
          child: Scaffold(
            bottomNavigationBar: SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return chat_list();
                      }), (r) {
                        return false;
                      });
                    },
                    icon: Icon(
                      Icons.question_answer_rounded,
                      size: 50,
                      color: Colors.grey,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return board_list();
                      }), (r) {
                        return false;
                      });
                    },
                    icon: Icon(
                      Icons.assignment_outlined,
                      size: 50,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return home();
                        }), (r) {
                          return false;
                        });
                      },
                      icon: Icon(Icons.home, size: 50),
                      padding: EdgeInsets.zero,
                      color: Colors.grey),
                  IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return alert();
                        }), (r) {
                          return false;
                        });
                      },
                      icon: Icon(Icons.notifications, size: 50),
                      padding: EdgeInsets.zero,
                      color: Colors.grey),
                  IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return setting();
                        }), (r) {
                          return false;
                        });
                      },
                      icon: Icon(Icons.settings, size: 50),
                      padding: EdgeInsets.zero,
                      color: Colors.grey)
                ],
              ),
            ),
            body: Column(
              children: [
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                        child: Text(
                          'BOARD',
                          style: Style_Title,
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 55, 0, 0),
                      //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                      child: Text(
                        '택시',
                        style: Style_helpT,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(95, 55, 0, 0),
                      //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return board_list();
                              }), (r) {
                                return false;
                              });
                            },
                            child: Icon(
                              Icons.chevron_left_rounded,
                              size: 40,
                            ),
                            style: OutlinedButton.styleFrom(
                                minimumSize: Size(50, 50),
                                padding: EdgeInsets.all(0),
                                side: BorderSide(width: 3, color: Colors.grey),
                                primary: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100)))),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1,
                ),
                Row(
                  //제목아래 박스 크기 및 색
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 17),
                      height: 2,
                      width: 94,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.grey,
                  height: 470,
                  width: double.infinity,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemCount: post.length,
                    itemExtent: 95,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < post.length) {
                        return Container(
                          margin: EdgeInsets.only(left: 9),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 320,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.33),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            2, 4), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => add_post(),
                                      ));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      padding: EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                post[index],
                                                style: Style_inTitle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                post1[index],
                                                style: Style_mini,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (heart_color[index] ==
                                                          Colors.red) {
                                                        heart_color[index] =
                                                            Colors.grey;
                                                      } else {
                                                        heart_color[index] =
                                                            Colors.red;
                                                      }
                                                    });
                                                  },
                                                  icon: Icon(Icons.favorite),
                                                  color: heart_color[index]),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.comment,
                                                    size: 30,
                                                    color: Colors.grey,
                                                  ))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 290),
                  child: Row(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => write_add()));
                        },
                        child: SizedBox(
                            child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 30,
                          ),
                        )),
                        foregroundColor: Colors.grey[600],
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(100)),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
