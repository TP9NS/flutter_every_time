import 'dart:convert';

import 'package:every/board/board_list.dart';
import 'package:every/home/home.dart';
import 'package:every/loggin/find_pas.dart';
import 'package:every/loggin/sign_up.dart';
import 'package:every/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class log_in extends StatefulWidget {
  const log_in({super.key});

  @override
  State<log_in> createState() => _log_inState();
}

class _log_inState extends State<log_in> {
  final numController = TextEditingController();
  final pasController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Center(
      child: SizedBox(
        //내가 추가 해본 곳
        width: Width_size,
        height: Height_size,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset('images/sheep.png'),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.grey[350],
                      child: Icon(Icons.account_circle),
                    ),
                    Container(
                      width: 200,
                      height: 23,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ' 학번',
                        ),
                        controller: numController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        color: Colors.grey[350], child: Icon(Icons.vpn_key)),
                    Container(
                      width: 200,
                      height: 23,
                      child: TextField(
                        decoration: InputDecoration(hintText: ' 비밀번호'),
                        obscureText: true,
                        controller: pasController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Map data = {
                      "num": numController.text,
                      "pas": pasController.text,
                    };
                    var body = jsonEncode(data);
                    Map<String, String> headers = {
                      "Accept": "application/json",
                      "content-type": "application/json",
                    };
                    http.Response _res = await http.post(
                        Uri.parse(dotenv.get('BASE_URL') + "log_in"),
                        headers: headers,
                        body: body);
                    if (_res.statusCode == 200) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('num', _res.body);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => home()));
                      //token을 받는 데 이 토큰을 통해 어캐 로그인 유지를 하는 가
                    }
                  },
                  child: const Text("로그인"),
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 38),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => sign_up()));
                          },
                          child: const Text("  회원가입  "),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.grey)),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                            return find_pas();
                          }), (r) {
                            return false;
                          });
                        },
                        child: const Text("비밀번호 찾기"),
                        style: ElevatedButton.styleFrom(primary: Colors.grey)),
                    const Padding(padding: EdgeInsets.all(20)),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
