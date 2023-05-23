import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:untitled2/data/modals/avatar_photo.dart';
import 'package:untitled2/data/modals/user.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:untitled2/data/user_repository.dart';

import '../data/api_constants.dart';

class CardDetailPage extends StatefulWidget {
  const CardDetailPage({Key? key}) : super(key: key);

  @override
  State<CardDetailPage> createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  final _userRepository = UserRepository();
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    final userCard = ModalRoute.of(context)!.settings.arguments as User;

    final sizeOfPicture = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            Column(
              children: [
                SizedBox(
                  height: sizeOfPicture + 70,
                  width: sizeOfPicture,
                  child: FutureBuilder<List<AvatarPhoto>>(
                    future: _userRepository.getAvatarPicture(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                        final items = snapshot.data ?? [];
                        return Column(
                          children: [
                            SizedBox(
                              height: sizeOfPicture,
                              width: sizeOfPicture,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(sizeOfPicture),
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, error) {
                                    return CircleAvatar(
                                      radius: sizeOfPicture,
                                      backgroundColor: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                                          [_random.nextInt(9) * 100],
                                    );
                                  },
                                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                  imageUrl: items.first.urlPhoto,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () async {
                                await _launchUrl(items.first.urlPhoto);
                              },
                              child: const Text(
                                'More information',
                                style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
                              ),
                            ),
                          ],
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),


                const SizedBox(height: 10),
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
      ),
    );
  }

  Future<void> _launchUrl(String urlPhoto) async {
    final url = Uri.parse(urlPhoto);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
