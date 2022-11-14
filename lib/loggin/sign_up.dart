import 'dart:convert';
import 'dart:async';
import 'package:every/loggin/UserInfo.dart';
import 'package:every/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

String url = "localhost:8080";

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _Sign_up();
}

class _Sign_up extends State<sign_up> {
  bool? Agree1;//개인정보 수집동의
  bool? Agree2;//이용약관 동의
  bool? _isButtonEnabled;

  @override
  void initState() {
    Agree1 = false; 
    Agree2 = false; 
    _isButtonEnabled = false;
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
          color: Colors.white,
          width: Width_size,
          height: Height_size,
          child: Column(children: [
            Row(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  child: Text(
                    '회원가입',
                    style: Style_Title,
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 65, 0, 0),
                child: Text(
                  '개인정보 수집 동의 & 이용약관 동의',
                  style: Style_helpT,
                ),
              ),
            ]),
            Row(
              children: [
                Container(
                  height: 2,
                  width: 330,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 40,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              //개인정보 수집동의
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: Text(
                    style: Style_SubTitle,
                    '개인정보 수집동의',
                  ),
                ),
                Material(
                  type: MaterialType.transparency,
                  child: Checkbox(
                    value: Agree1,
                    onChanged: (value) {
                      setState(() {
                        Agree1 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.shade300)),
              height: 200,
              child: ListView(
                padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                children: [
                  Text(
                      style: Style_Tnomarl,
                      '/개인정보 수집 내용/개인정보 수집 내용/개인정보 수집 내용/개인정보 수집 내용/개인정보 수집 내용/개인정보 수집 내용/'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              //이용약관 동의
              children: [
                Material(
                    type: MaterialType.transparency,
                    child: Text(
                      '이용약관 동의',
                      style: Style_SubTitle,
                    )),
                Material(
                  type: MaterialType.transparency,
                  child: Checkbox(
                    value: Agree2,
                    onChanged: (value) {
                      setState(() {
                        Agree2 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.shade300)),
              height: 200,
              child: ListView(
                padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                children: [
                  Text(
                      style: Style_Tnomarl,
                      '/이용약관 내용/이용약관 내용/이용약관 내용/이용약관 내용/이용약관 내용/이용약관 내용/이용약관 내용/이용약관 내용/이용약관 내용/'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async{
                        Map data = {
                          "agree1" : Agree1,
                          "agree2" : Agree2,
                        };
                        var body = jsonEncode(data);
                        Map<String,String> headers = {
                          "Accept": "application/json",
                          "content-type": "application/json",
                        };
                        http.Response _res = await http.post(Uri.parse("http://localhost:8080/agree"),
                            headers: headers,
                            body: body
                            );
                            if(_res.body == "ok"){
                               Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserInfo(),
                             ));
                          }
                      },
                      child: SizedBox(
                          height: 40,
                          width: 80,
                          child: const Center(
                            child: Text(
                              '다음',
                            ),
                          )),
                      style: ElevatedButton.styleFrom(primary: Colors.grey)),
                ],
              ),
            )
          ])),
    );
  }
}
