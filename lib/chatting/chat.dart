import 'dart:html';
import 'dart:io';
import 'package:every/chatting/chat_message.dart';
import 'package:every/chatting/controller.dart';
import 'package:every/loggin/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _Chat();
}

List<chatmessage> _chat = [];

class _Chat extends State<Chat> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  var num;
  late IO.Socket socket;
  ChatController chatController = ChatController();
  checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    num = prefs.getString('num');
  }

  void initState() {
    checkToken();
    socket = IO.io(
        'http://localhost:4000',
        IO.OptionBuilder()
            .setTransports(['WebSocket'])
            .disableAutoConnect()
            .build());
    socket.connect();
    setUpSocketListener();
    super.initState();
  }

  void setUpSocketListener() {
    socket.on('message-receive', (data) {
      print(data);
    });
  }

  Widget build(BuildContext context) {
    if (checkToken() == '') {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => log_in()));
    }
    return Center(
      child: Container(
        width: 380,
        height: 800,
        child: Scaffold(
          appBar: AppBar(
            title: Text('닉네임'),
            backgroundColor: Colors.grey,
          ),
          body: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return _chat[index];
                },
                itemCount: _chat.length,
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(hintText: "메세지 입력창"),
                        onSubmitted: _handleSubmitted,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.image_rounded)),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  //Dialog Main Title

                                  //
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "정말로 신고하시겠습니까? \n 채팅 내용이 운영자에게 전달됩니다.",
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    new TextButton(
                                      child: new Text("네"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    new TextButton(
                                      child: new Text("아니요"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: Icon(Icons.campaign_outlined))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    Logger().d(text);
    setState(() {
      var messagejson = {"message": text, "sent": socket.id};
      socket.emit('message', messagejson);
      chatmessage newchat = chatmessage(text);
      _textEditingController.clear();
      _chat.add(newchat);
    });
    _textEditingController.clear();
  }
}
