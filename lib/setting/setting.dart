import 'package:every/board/board_list.dart';
import 'package:every/chatting/chat_list.dart';
import 'package:every/home/home.dart';
import 'package:every/loggin/log.dart';
import 'package:every/style.dart';
import 'package:flutter/material.dart';
import 'package:every/ALERT/alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class setting extends StatefulWidget {
  const setting({super.key});
  @override
  State<setting> createState() => _setting();
}

class _setting extends State<setting> {
  bool isOpen = false;

  @override
  checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return token;
  }

  Widget build(BuildContext context) {
    if (checkToken() == true) {
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => chat_list()));
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
                      icon: Icon(Icons.assignment_outlined,
                          size: 50, color: Colors.grey),
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
                        onPressed: () {},
                        icon: Icon(Icons.settings, size: 50),
                        padding: EdgeInsets.zero,
                        color: Colors.black)
                  ],
                ),
              ),
              body: Stack(
                children: [
                  page(
                    onEdit: () {
                      setState(() {
                        isOpen = true;
                      });
                    },
                  ),
                  if (isOpen)
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 112, 27, 0),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: SizedBox(
                          width: 300,
                          height: 500,
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey)),
                                    height: 70,
                                    width: 70,
                                    child: Image.asset('images/sheep.png'),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 10),
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
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.grey),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('이름'),
                                SizedBox(
                                  width: 150,
                                  child: Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('닉네임'),
                                SizedBox(
                                  width: 150,
                                  child: Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('학번'),
                                SizedBox(
                                  width: 150,
                                  child: Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('비밀번호'),
                                SizedBox(
                                  width: 150,
                                  child: Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
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
                                        setState(() {
                                          isOpen = false;
                                        });
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
                      ),
                    ),
                ],
              ),
            )));
  }
}

class page extends StatelessWidget {
  final void Function() onEdit;

  const page({super.key, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
            child: Text(
              'SETTING',
              style: Style_Title,
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 55, 0, 0),
          //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        ),
      ]),
      SizedBox(
        height: 2,
      ),
      Container(
        margin: EdgeInsets.only(left: 17),
        height: 2,
        width: 110,
        color: Colors.grey,
      ),
      SizedBox(
        height: 20,
      ),
      Ink(
        color: Colors.grey[200],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ))),
                    child: const Text(
                      "내 정보",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Ink(
                            width: 72.0,
                            height: 72.0,
                            child: Image.asset('images/sheep.png'),
                          ),
                          const Text(
                            "아냥이",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "닉네임",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "아이디",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "비밀번호",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              onTap: onEdit,
              child: Icon(Icons.border_color),
            )
          ],
        ),
      ),
      const SizedBox(height: 24.0),
      Ink(
        width: double.infinity,
        height: 375,
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 64.0),
            Ink(
              width: 200.0,
              height: 1.0,
              color: Colors.black,
            ),
            const SizedBox(height: 16.0),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0, right: 16.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
              child: Text(
                "글씨체 바꾸기",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0, right: 16.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
              child: Text(
                "알림 설정",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Ink(
              width: 200.0,
              height: 1.0,
              color: Colors.black,
            ),
            const SizedBox(height: 16.0),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0, right: 16.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
              child: Text(
                "회원 탈퇴",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0, right: 16.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
              child: Text(
                "로그 아웃",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 86,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0, right: 16.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
              child: Text(
                "anyang E dle every time.VER.BETA.\n copyright gigsazo",
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
