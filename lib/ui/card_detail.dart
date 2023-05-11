import 'package:flutter/material.dart';
import 'package:untitled2/data/user.dart';
import 'dart:math';

class CardDetail extends StatefulWidget {
  const CardDetail({Key? key}) : super(key: key);

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  @override
  Widget build(BuildContext context) {
    final userCard = ModalRoute.of(context)!.settings.arguments as User;
    final _random = Random();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor:
                      Colors.primaries[_random.nextInt(Colors.primaries.length)]
                          [_random.nextInt(9) * 100],
                ),
                const SizedBox(height: 20),
                Text(
                  userCard.name,
                  style: const TextStyle(
                    fontSize: 26,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username: ${userCard.username}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'E-mail: ${userCard.email}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'City: ${userCard.address.city}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Company: ${userCard.company.name}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
