import 'dart:math';

import 'package:flutter/material.dart';

import '../data/modals/posts.dart';

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final _random = Random();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
        shadowColor: Colors.blue,
        child: ListTile(
          contentPadding: const EdgeInsets.all(20),
          tileColor: Colors.primaries[_random.nextInt(Colors.primaries.length)]
          [_random.nextInt(9) * 100]?.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(widget.post.title),
          ),
          subtitle: Text(widget.post.body),
        ),
      ),
    );
  }
}
