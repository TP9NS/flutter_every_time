import 'package:every/board/board_list/board_list_free.dart';
import 'package:every/board/edit_post.dart';
import 'package:every/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//11페이지
class add_post extends StatefulWidget {
  final token;
  const add_post(this.token, {Key? key}) : super(key: key);

  @override
  State<add_post> createState() => _add_post();
}

class _add_post extends State<add_post> {
  bool? Anon;
  String? Name;
  @override
  void initState() {
    Anon = true;
    Name = '익명';
  }

  Widget build(BuildContext context) {
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
                                        size: 50,
                                      ),
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 0.5, color: Colors.grey),
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 40, 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Board_list_free(
                                                      widget.token)));
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
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 20, 0, 0),
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          edit_post()));
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                              size: 30,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)),
                                                      //Dialog Main Title

                                                      //
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
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
                                                          child: new Text("네"),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        new TextButton(
                                                          child:
                                                              new Text("아니요"),
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
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(5)),
              height: 50,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Checkbox(
                  side: MaterialStateBorderSide.resolveWith(
                      (states) => BorderSide(width: 2, color: Colors.white)),
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent),
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
                Flexible(
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: '$Name',
                    enabledBorder: InputBorder.none,
                  )),
                ),
                IconButton(
                  iconSize: 40,
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  icon: Icon(Icons.image_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 30,
                  color: Colors.white,
                  icon: Icon(Icons.send),
                  onPressed: () {},
                ),
              ]),
            ),
          )),
    );
  }
}
