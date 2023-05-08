import 'dart:math';

import 'package:flutter/material.dart';

import '../data/user.dart';

class CardWidget extends StatefulWidget {
  final User user;

  const CardWidget({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return Card(
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
              backgroundColor:
                  Colors.primaries[_random.nextInt(Colors.primaries.length)]
                      [_random.nextInt(9) * 100],
            ),
            const SizedBox(
              width: 20,
            ),
            Text(widget.user.name),
          ],
        ),
      ),
    );
  }
}
