import 'dart:async';
import 'package:every/home/home.dart';
import 'package:every/board/board_list.dart';
import 'package:every/chatting/chat.dart';
import 'package:every/chatting/chat_list.dart';
import 'package:every/loggin/find_pas.dart';
import 'package:every/loggin/log.dart';
import 'package:every/loggin/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:every/style.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:every/chatting/chat_message.dart';
import 'package:every/ALERT/alert.dart';
import 'package:every/setting/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum matching { start, stop }

class random extends StatefulWidget {
  const random({super.key});

  @override
  State<random> createState() => _ramdom();
}

matching match_status = matching.stop;

class _ramdom extends State<random> {
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
    void start() {
      setState(() {
        print(match_status.toString());
        match_status = matching.start;
      });
    }

    void stop() {
      setState(() {
        print(match_status.toString());
        match_status = matching.stop;
      });
    }

    final List<Widget> _startButton = [
      SizedBox(
        width: 180,
        height: 40,
        child: ElevatedButton(
          child: Text(
            match_status == matching.stop ? 'start' : 'stop',
            style: TextStyle(),
          ),
          style: ElevatedButton.styleFrom(
            primary: match_status == matching.stop ? Colors.green : Colors.red,
          ),
          onPressed: match_status == matching.stop ? start : stop,
        ),
      ),
    ];
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.question_answer_rounded,
                    size: 50,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.zero,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return board_list();
                    }), (r) {
                      return false;
                    });
                  },
                  icon: Icon(
                    Icons.assignment_outlined,
                    size: 50,
                    color: Colors.grey,
                  ),
                  padding: EdgeInsets.zero,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return home();
                      }), (r) {
                        return false;
                      });
                    },
                    icon: Icon(Icons.home, size: 50),
                    padding: EdgeInsets.zero,
                    color: Colors.grey),
                IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return alert();
                      }), (r) {
                        return false;
                      });
                    },
                    icon: Icon(Icons.notifications, size: 50),
                    padding: EdgeInsets.zero,
                    color: Colors.grey),
                IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return setting();
                      }), (r) {
                        return false;
                      });
                    },
                    icon: Icon(Icons.settings, size: 50),
                    padding: EdgeInsets.zero,
                    color: Colors.grey)
              ],
            ),
          ),
          body: Center(
              child: Container(
                  color: Colors.white,
                  width: 380,
                  height: 800,
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                              child: Text(
                                'RAMDOM',
                                style: Style_Title,
                              )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 50, 10, 0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => chat_list()));
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 30,
                              ),
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Container(
                            height: 2,
                            width: 120,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Image.asset('images/sheep.png'),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _startButton),
                  ]))),
        ),
      ),
    );
  }
}
