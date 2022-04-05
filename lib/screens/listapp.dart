import 'package:flutter/material.dart';

class ListApp extends StatefulWidget {
  const ListApp({Key? key}) : super(key: key);

  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List aapp'),
      ),
      body: Text('hii'),
    );
  }
}
