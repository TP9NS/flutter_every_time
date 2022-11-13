import 'package:every/board/board_list.dart';
import 'package:every/home/home.dart';
import 'package:every/loggin/find_pas.dart';
import 'package:every/loggin/sign_up.dart';
import 'package:every/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class log_in extends StatelessWidget {
  const log_in({super.key});

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
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 38),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return sign_up();
                            }), (r) {
                              return false;
                            });
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
