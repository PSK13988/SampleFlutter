import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_2/screens/bottom_bar.dart';
import 'package:sample_2/screens/home_page.dart';
import 'package:sample_2/screens/list.dart';
import 'package:sample_2/screens/listapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample update',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyStreamExample1(),
    );
  }
}

class MyStreamExample1 extends StatefulWidget {
  const MyStreamExample1({Key? key}) : super(key: key);

  @override
  State<MyStreamExample1> createState() => _MyStreamExample1State();
}

class _MyStreamExample1State extends State<MyStreamExample1> {
  final _counterController = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    return const ListApp();
  }
}
