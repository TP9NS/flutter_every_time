import 'dart:convert';

import 'package:every/board/board_list.dart';
import 'package:every/board/board_list/babmuk.dart';
import 'package:every/board/board_list/board_list_free.dart';
import 'package:every/loggin/log.dart';
import 'package:every/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

//12
class write_add extends StatefulWidget {
  const write_add({super.key});

  @override
  State<write_add> createState() => _write_add();
}

final titleController = TextEditingController();
final contentsController = TextEditingController();

class _write_add extends State<write_add> {
  final boardList = [
    '술 먹을 사람?',
    '밥 먹을 사람?',
    '택시 탈 사람?',
    '안양인들의 강화마켓',
    '자유게시판',
    '피드백'
  ];

  var _selectBoard = '술 먹을 사람?';
  bool? Anon;
  String? Name;
  String? token;
  @override
  checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  void initState() {
    Anon = true;
    Name = '익명';
    checkToken();
  }

  Widget build(BuildContext context) {
    if (checkToken() == Null) {
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
                  flex: 10,
                  child: Container(
                      color: Colors.grey[200],
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                      child: Container(
                        color: Colors.grey[200],
                        child: Column(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '글쓰기',
                                        style: Style_Title,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                        height: 2,
                                        width: 80,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Board_list_free()));
                                    },
                                    child: Icon(
                                      Icons.chevron_left_rounded,
                                      size: 40,
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        minimumSize: Size(50, 50),
                                        padding: EdgeInsets.all(0),
                                        side: BorderSide(
                                            width: 3, color: Colors.black),
                                        primary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100)))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Icon(
                                            Icons.person,
                                            size: 40,
                                          ),
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                width: 0.5, color: Colors.grey),
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 0, 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text('$Name',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Checkbox(
                                          side: MaterialStateBorderSide
                                              .resolveWith((states) =>
                                                  BorderSide(
                                                      width: 2,
                                                      color: Colors.black)),
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Colors.black),
                                          splashRadius: 0,
                                          value: Anon,
                                          onChanged: (value) {
                                            setState(() {
                                              Anon = value;
                                              if (value == true)
                                                Name = '익명';
                                              else
                                                Name = '닉네임';
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  DropdownButton(
                                      value: _selectBoard,
                                      items: boardList.map(
                                        (value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectBoard = value.toString();
                                        });
                                      }),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.image_outlined,
                                        size: 35,
                                        color: Colors.grey[700],
                                      )),
                                ],
                              )
                            ],
                          ),
                          Container(
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
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
                                controller: titleController,
                              ),
                              TextField(
                                maxLines: 5,
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintText: '내용'),
                                controller: contentsController,
                              ),
                            ]),
                          )
                        ]),
                      ))),
            ]),
            bottomNavigationBar: Container(
              height: 100,
              color: Colors.grey[200],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        Map data = {
                          "anon": Anon,
                          "token": token,
                          "title": titleController.text,
                          "contents": contentsController.text,
                          "board": _selectBoard,
                        };
                        var body = jsonEncode(data);
                        Map<String, String> headers = {
                          "Accept": "application/json",
                          "content-type": "application/json",
                        };
                        http.Response _res = await http.post(
                            Uri.parse(dotenv.get('BASE_URL') + "write_add"),
                            headers: headers,
                            body: body);
                        if (_res.statusCode == 200) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => board_list()));
                        }
                      },
                      child: SizedBox(
                          height: 40,
                          width: 80,
                          child: const Center(
                            child: Text(
                              '완료',
                            ),
                          )),
                      style: ElevatedButton.styleFrom(primary: Colors.grey)),
                ],
              ),
            )),
      ),
    );
  }
}
