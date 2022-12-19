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
import 'package:every/setting/setting.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _home();
}

class _home extends State<home> {
  @override
  var num;

  checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    num = prefs.getString('num');
  }

  void initState() {
    checkToken();
  }

  Widget build(BuildContext context) {
    if (checkToken() == '') {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => log_in()));
    }
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
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => chat_list()));
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => board_list()));
                    },
                    icon: Icon(
                      Icons.assignment_outlined,
                      size: 50,
                      color: Colors.grey,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.home, size: 50),
                      padding: EdgeInsets.zero,
                      color: Colors.black),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => alert()));
                      },
                      icon: Icon(Icons.notifications, size: 50),
                      padding: EdgeInsets.zero,
                      color: Colors.grey),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => setting()));
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
                          'HOME',
                          style: Style_Title,
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 55, 0, 0),
                      //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                      child: Text(
                        '학교정보',
                        style: Style_helpT,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(130, 55, 0, 0),
                      //padding: EdgeInsets.fromLTRB(left, top, right, bottom),

                      child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  //Dialog Main Title

                                  //
                                  content: SizedBox(
                                    width: 280,
                                    height: 500,
                                    child: Column(children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.grey)),
                                              height: 70,
                                              width: 70,
                                              child: Image.asset(
                                                  'images/sheep.png'),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '프로필 이미지',
                                                      style: Style_helpT,
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        'UPLOAD',
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              primary:
                                                                  Colors.grey),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('이름'),
                                          SizedBox(
                                            width: 150,
                                            child: Flexible(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: '아냥이'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('닉네임'),
                                          SizedBox(
                                            width: 150,
                                            child: Flexible(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: '아냥이'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('학번'),
                                          SizedBox(
                                            width: 150,
                                            child: Flexible(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: '아냥이'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('비밀번호'),
                                          SizedBox(
                                            width: 150,
                                            child: Flexible(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: '아냥이'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: SizedBox(
                                                  child: const Center(
                                                    child: Text('back'),
                                                  ),
                                                  height: 40,
                                                  width: 80,
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                );
                              });

                          // 내 정보 띄우기
                        },
                        icon: Icon(
                          Icons.account_circle_outlined,
                          size: 40,
                        ),
                        color: Colors.grey,
                        padding: EdgeInsets.zero,
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
                      width: 85,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 15)),
                    Text(
                      '공지사항',
                      style: Style_Title,
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 180,
                  width: 372,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: Container(
                    height: 10,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 200,
                      itemExtent: 55,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(left: 9),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 348,
                                  height: 50,
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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '이태화 교수님 $index',
                                            style: Style_mini,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text('사랑합니다',
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.black)),
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
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 15)),
                    Text(
                      '시간표',
                      style: Style_Title,
                    ),
                    Padding(padding: EdgeInsets.only(left: 240)),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  //Dialog Main Title

                                  //
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "시간표를 등록 OR 수정하시겠습니까?",
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    new TextButton(
                                      child: new Text("네"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    new TextButton(
                                      child: new Text("아니요"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 25,
                          color: Colors.black,
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(child: Image.asset('images/sheep.png')),
              ],
            ),
          )),
    );
  }
}
