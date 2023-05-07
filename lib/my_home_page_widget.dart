import 'dart:math';

import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var items = List<String>.generate(100, (i) => 'Item $i');
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: ()  async {
          setState(() {
          });
        },
        child: ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                elevation: 8,
                shadowColor: Colors.blue,
                child: ListTile(
                  tileColor: Colors.white38,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                        [_random.nextInt(9) * 100],
                      ),
                      const SizedBox(width: 20,),
                      Text(items[index]),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 8);
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
