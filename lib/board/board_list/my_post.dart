import 'package:every/board/add_post.dart';
import 'package:every/board/board_list.dart';
import 'package:every/chatting/chat.dart';
import 'package:every/chatting/chat_message.dart';
import 'package:every/board/edit_post.dart';
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

//15
class my_post extends StatefulWidget {
  final token;
  const my_post(this.token, {Key? key}) : super(key: key);

  @override
  State<my_post> createState() => _my_post();
}

class _my_post extends State<my_post> {
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
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Chat()));
                    },
                    icon: Icon(
                      Icons.question_answer_rounded,
                      size: 50,
                      color: Colors.grey,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.assignment_outlined,
                      size: 50,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => home(widget.token)));
                      },
                      icon: Icon(Icons.home, size: 50),
                      padding: EdgeInsets.zero,
                      color: Colors.grey),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => alert(widget.token)));
                      },
                      icon: Icon(Icons.notifications, size: 50),
                      padding: EdgeInsets.zero,
                      color: Colors.grey),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => setting(widget.token)));
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
                        '내가 쓴 글',
                        style: Style_helpT,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(130, 55, 0, 0),
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
                            Navigator.of(context).pop(MaterialPageRoute(
                                builder: (context) =>
                                    board_list(widget.token)));
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)))),
                        ),
                      ),
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
                      width: 90,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
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
                                      builder: (context) =>
                                          add_post(widget.token),
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
                                              '내가 쓴 글 $index',
                                              style: Style_inTitle,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '이거 멘트도 고민 많이했어요',
                                              style: Style_mini,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            edit_post()));
                                              },
                                              icon: Icon(Icons.edit),
                                              color: Colors.grey,
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
                                                      barrierDismissible: false,
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
                                                            children: <Widget>[
                                                              Text(
                                                                "삭제 하시겠습니까?",
                                                              ),
                                                            ],
                                                          ),
                                                          actions: <Widget>[
                                                            new TextButton(
                                                              child:
                                                                  new Text("네"),
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
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
