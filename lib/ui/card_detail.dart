import 'package:flutter/material.dart';
import 'package:untitled2/data/user.dart';

class CardDetail extends StatefulWidget {
  const CardDetail({Key? key}) : super(key: key);

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  @override
  Widget build(BuildContext context) {
    final userCard = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(userCard.name),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              userCard.company.name,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
