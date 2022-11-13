import 'dart:collection';
import 'dart:convert';
import 'package:every/loggin/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() async {
  String url = "http://localhost:8080/";
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode; 
  if(statusCode == 200){
    var responseHeaders = response.headers;
  var responseBody = utf8.decode(response.bodyBytes);

  print("statusCode: ${statusCode}");
  print("responseHeaders: ${responseHeaders}");
  print("responseBody: ${responseBody}");
  }
  else {
    print('응답 안댐');
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Every',
      home: log_in(),
    );
  }
}

class MyHomepage extends StatelessWidget {
  MyHomepage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("log in"),
      ),
    );
  }
}
