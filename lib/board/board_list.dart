import 'package:every/board/board_list/NOTICE.dart';
import 'package:every/board/board_list/babmuk.dart';
import 'package:every/board/board_list/board_list_free.dart';
import 'package:every/board/board_list/drink_beer.dart';
import 'package:every/board/board_list/feedback.dart';
import 'package:every/board/board_list/market.dart';
import 'package:every/board/board_list/taxi.dart';
import 'package:every/chatting/chat.dart';
import 'package:every/chatting/chat_list.dart';
import 'package:every/board/board_list/my_comment.dart';
import 'package:every/board/board_list/my_post.dart';
import 'package:every/chatting/random.dart';
import 'package:every/loggin/log.dart';
import 'package:every/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:every/ALERT/alert.dart';
import 'package:every/home/home.dart';
import 'package:every/setting/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

//목업 9페이지
class board_list extends StatefulWidget {
  const board_list({super.key});

  @override
  State<board_list> createState() => _Board_list();
}

class _Board_list extends State<board_list> {
  @override
  var num;
  var count;

  checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    num = prefs.getString('num');
  }

  void initState() {
    var count = 0;
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.assignment_outlined,
                      size: 50,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => home()));
                      },
                      icon: Icon(Icons.home, size: 50),
                      padding: EdgeInsets.zero,
                      color: Colors.grey),
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
                          'BOARD',
                          style: Style_Title,
                        )),
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
                //제목과의 여백
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      height: 2,
                      width: 15,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        width: 170,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => my_post(),
                            ));
                          },
                          child: const Text(
                            "내가 쓴 글",
                            style: Style_Tnomarl,
                          ),
                          style: TextButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              primary: Colors.grey[200],
                              padding: EdgeInsets.only(left: 2)),
                        )),
                  ],
                ),
                //글 들 아래 막대기와 공간 크기
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.grey[850],
                    )
                  ],
                ),
                //글 들 사이의 여백
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Container(
                      height: 2,
                      width: 15,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        width: 170,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => my_comment(),
                            ));
                          },
                          child: const Text(
                            "댓글 단 글",
                            style: Style_Tnomarl,
                          ),
                          style: TextButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              primary: Colors.grey[200],
                              padding: EdgeInsets.only(left: 2)),
                        )),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.grey[850],
                    )
                  ],
                ),
                //댓글 단 글 과 술먹을 사람 사이의 여백
                SizedBox(
                  height: 37,
                ),
                Row(
                  children: [
                    Container(
                      height: 2,
                      width: 15,
                      color: Colors.black,
                    ),
                    //술 먹을 사람의 위치 정해줌
                    SizedBox(
                      width: 15,
                    ),
                    //술 먹을 사람에 네모 원형으로 감싸진 회색 관련 코드
                    Container(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey[200],
                        ),
                        width: 170,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => drink_beer()));
                          },
                          child: const Text(
                            "술 먹을 사람?",
                            style: Style_Tnomarl,
                          ),
                          style: TextButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              primary: Colors.grey[200],
                              padding: EdgeInsets.only(left: 2)),
                        )),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.grey[850],
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Container(
                      height: 2,
                      width: 15,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey[200],
                        ),
                        width: 170,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => babmuk()));
                          },
                          child: const Text(
                            "밥 먹을 사람?",
                            style: Style_Tnomarl,
                          ),
                          style: TextButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              primary: Colors.grey[200],
                              padding: EdgeInsets.only(left: 2)),
                        )),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.grey[850],
                    )
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    Container(
                      height: 2,
                      width: 15,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey[200],
                        ),
                        width: 170,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => taxi()));
                          },
                          child: const Text(
                            "택시 탈 사람?",
                            style: Style_Tnomarl,
                          ),
                          style: TextButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              primary: Colors.grey[200],
                              padding: EdgeInsets.only(left: 2)),
                        )),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.grey[850],
                    )
                  ],
                ),
                SizedBox(
                  height: 26,
                ),
                Row(
                  children: [
                    Container(
                      height: 2,
                      width: 15,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        width: 170,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => market()));
                          },
                          child: const Text(
                            "아냥이들의 강화마켓",
                            style: Style_Tnomarl,
                          ),
                          style: TextButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              primary: Colors.grey[200],
                              padding: EdgeInsets.only(left: 2)),
                        )),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.grey[850],
                    )
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    Container(
                      height: 2,
                      width: 15,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey[200],
                        ),
                        width: 170,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Board_list_free()));
                          },
                          child: const Text(
                            "자유게시판",
                            style: Style_Tnomarl,
                          ),
                          style: TextButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              primary: Colors.grey[200],
                              padding: EdgeInsets.only(left: 2)),
                        )),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.grey[850],
                    )
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    Container(
                      height: 2,
                      width: 15,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        width: 170,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => feedback()));
                          },
                          child: const Text(
                            "피드백",
                            style: Style_Tnomarl,
                          ),
                          style: TextButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              primary: Colors.grey[200],
                              padding: EdgeInsets.only(left: 2)),
                        )),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.grey[850],
                    )
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    Container(
                      height: 2,
                      width: 15,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        width: 170,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => NOTICE()));
                          },
                          child: const Text(
                            "공지사항",
                            style: Style_Tnomarl,
                          ),
                          style: TextButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              primary: Colors.grey[200],
                              padding: EdgeInsets.only(left: 2)),
                        )),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.grey[850],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
