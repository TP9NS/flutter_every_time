import 'package:every/loggin/log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class chatmessage extends StatelessWidget {
  final String txt;

  const chatmessage(
    this.txt, {
    Key,
  }) : super(key: Key);

  @override
  checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return token;
  }

  Widget build(BuildContext context) {
    if (checkToken() == '') {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => log_in()));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
      child: Container(
        margin: EdgeInsets.only(left: 100),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.33),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(2, 4), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              child: CircleAvatar(
                child: Image.asset('images/sheep.png'),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "닉네임",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  txt,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
