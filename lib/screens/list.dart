import 'dart:async';

import 'package:flutter/material.dart';

class ListMaking extends StatefulWidget {
  const ListMaking({Key? key}) : super(key: key);

  @override
  State<ListMaking> createState() => _ListMakingState();
}

class _ListMakingState extends State<ListMaking> {
  final List<String> _numbers = <String>[];
  final StreamController<List<String>> _controller = StreamController<List<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list of numbers'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<String>>(
                stream: _controller.stream,
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                              ),
                              iconSize: 20,
                              color: Colors.green,
                              splashColor: Colors.purple,
                              onPressed: () {
                                print(_numbers);
                                _numbers.removeAt(index);
                                _controller.add(_numbers);
                              },
                            ),
                            title: Text('${snapshot.data?[index]} '));
                      });
                }),
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
            onPressed: () {
              _numbers.add(_numbers.length.toString());
              _controller.add(_numbers);
            },
          )
        ],
      ),
    );
  }
}
