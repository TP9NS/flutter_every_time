import 'package:every/board/board_list/board_list_free.dart';
import 'package:every/loggin/log.dart';
import 'package:every/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

//13
class edit_post extends StatefulWidget {
  const edit_post({super.key});

  @override
  State<edit_post> createState() => _edit_post();
}

class _edit_post extends State<edit_post> {
  bool? Anon;
  String? Name;
  @override
  checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return token;
  }

  void initState() {
    Anon = true;
    Name = '익명';
  }

  Widget build(BuildContext context) {
    if (checkToken() == true) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => log_in()));
    }
    return Center(
      child: SizedBox(
          width: Width_size,
          height: Height_size,
          child: Scaffold(
              body: Column(children: [
                Expanded(
                    flex: 12,
                    child: Container(
                        color: Colors.grey[200],
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: Container(
                          color: Colors.grey[200],
                          child: Column(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '수정',
                                      style: Style_Title,
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      height: 2,
                                      width: 70,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Icon(
                                              Icons.person,
                                              size: 50,
                                            ),
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  width: 0.5,
                                                  color: Colors.grey),
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 40, 25),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('익명 / 닉네임',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          Text('날짜 & 시간')
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Icon(
                                            Icons.chevron_left_rounded,
                                            size: 40,
                                          ),
                                          style: OutlinedButton.styleFrom(
                                              minimumSize: Size(50, 50),
                                              padding: EdgeInsets.all(0),
                                              side: BorderSide(
                                                  width: 3,
                                                  color: Colors.black),
                                              primary: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              100)))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              50, 20, 0, 0),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.image_outlined,
                                                    size: 30,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade400,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(3, 3))
                                  ]),
                              padding: EdgeInsets.all(10),
                              child: Column(children: [
                                TextField(
                                  style: TextStyle(fontSize: 30),
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintText: '제목',
                                    hintStyle: TextStyle(fontSize: 30),
                                  ),
                                ),
                                TextField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: '내용'),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: Colors.grey,
                                        )),
                                    Text('0'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.chat_outlined,
                                          color: Colors.grey,
                                        )),
                                    Text('0'),
                                  ],
                                )
                              ]),
                            )
                          ]),
                        ))),
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        'Comment',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 30,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 8,
                    child: ListView.builder(
                        itemCount: 30,
                        itemBuilder: (BuildContext ctx, int index) {
                          return Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.person,
                                    size: 30,
                                  ),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 0.5, color: Colors.grey),
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(7)),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '익명 / 닉네임 $index',
                                        style: Style_Tnomarl,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '교수님 사랑합니다',
                                        style: Style_mini,
                                      )
                                    ]),
                              ],
                            ),
                            width: double.infinity,
                            height: 100,
                            color: Colors.grey[index % 2 * 200],
                          );
                        })),
              ]),
              bottomNavigationBar: Container(
                height: 30,
                color: Colors.grey[200],
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: SizedBox(
                            height: 30,
                            width: 80,
                            child: const Center(
                              child: Text(
                                '다음',
                              ),
                            )),
                        style: ElevatedButton.styleFrom(primary: Colors.grey)),
                  ],
                ),
              ))),
    );
  }
}
