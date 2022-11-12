import 'package:every/home/home.dart';
import 'package:every/loggin/sign_up.dart';
import 'package:every/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Center(
      child: Container(
        color: Colors.white,
        width: Width_size,
        height: Height_size,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(children: [
            Row(children: [
              Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    '회원가입',
                    style: Style_Title,
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 65, 0, 0),
                child: Text(
                  '가입정보 입력',
                  style: Style_helpT,
                ),
              ),
            ]),
            Row(
              children: [
                Container(
                  height: 2,
                  width: 195,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 100,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    height: 100,
                    width: 100,
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
                            child: Text('UPLOAD'),
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
                  width: 270,
                  child: Flexible(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
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
                  width: 270,
                  child: Flexible(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
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
                  width: 270,
                  child: Flexible(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
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
                  width: 270,
                  child: Flexible(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
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
                Text('비밀번호 확인'),
                SizedBox(
                  width: 270,
                  child: Flexible(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(MaterialPageRoute(
                          builder: (context) => const sign_up(),
                        ));
                      },
                      child: SizedBox(
                        child: const Center(
                          child: Text('back'),
                        ),
                        height: 40,
                        width: 80,
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.grey)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return home();
                        }), (r) {
                          return false;
                        });
                      },
                      child: SizedBox(
                        child: const Center(
                          child: Text('next'),
                        ),
                        height: 40,
                        width: 80,
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.grey)),
                ],
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
