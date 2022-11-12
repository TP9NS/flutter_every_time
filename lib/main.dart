import 'dart:collection';
import 'package:every/loggin/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
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
        child: Text("long in"),
      ),
    );
  }
}
