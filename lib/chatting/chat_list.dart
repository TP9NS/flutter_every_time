import 'package:every/board/add_post.dart';
import 'package:every/board/board_list.dart';
import 'package:every/chatting/chat.dart';
import 'package:every/chatting/chat_message.dart';
import 'package:every/chatting/random.dart';
import 'package:every/loggin/sign_up.dart';
import 'package:every/style.dart';
import 'package:every/board/write_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:every/ALERT/alert.dart';
import 'package:every/home/home.dart';
import 'package:every/setting/setting.dart';

class chat_list extends StatefulWidget {
   const chat_list({super.key});
  @override
  State<chat_list> createState() => _chat_list();
}

class _chat_list extends State<chat_list> {
  @override
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.question_answer_rounded,
                      size: 50,
                      color: Colors.black,
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
                      color: Colors.grey,
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
                          'MessageList',
                          style: Style_Title,
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 55, 0, 0),
                      //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(80, 55, 0, 0),
                      //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  //제목아래 박스 크기 및 색
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 2,
                        width: 157,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 470,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 200,
                    itemExtent: 95,
                    itemBuilder: (BuildContext context, int index) {
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
                                      builder: (context) => const Chat(),
                                    ));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                width: 50,
                                                height: 70,
                                                child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: Image.asset(
                                                        'images/sheep.png'))),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '닉네임 $index ',
                                                    style: Style_inTitle,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '채팅 메세지가 블라블라',
                                                    style: Style_mini,
                                                  )
                                                ]),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      71, 30, 0, 0),
                                              child: IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
                                                        barrierDismissible:
                                                            false,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0)),
                                                            //Dialog Main Title

                                                            //
                                                            content: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                  "삭제 하시겠습니까?",
                                                                ),
                                                              ],
                                                            ),
                                                            actions: <Widget>[
                                                              new TextButton(
                                                                child: new Text(
                                                                    "네"),
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              ),
                                                              new TextButton(
                                                                child: new Text(
                                                                    "아니요"),
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    size: 17,
                                                    color: Colors.grey,
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
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
                              builder: (context) => random()));
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
