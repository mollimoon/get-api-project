import 'dart:math';

import 'package:flutter/material.dart';

import '../data/modals/user.dart';

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
        contentPadding: EdgeInsets.all(10),
        tileColor: Colors.white38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.primaries[_random.nextInt(Colors.primaries.length)][_random.nextInt(9) * 100],
        ),
        title: Text(widget.user.name),
        subtitle: Text(widget.user.company.name),
      ),
    );
  }
}
