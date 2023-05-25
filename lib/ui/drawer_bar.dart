import 'package:flutter/material.dart';

import '../data/routes.dart';

class DrawerAppBar extends StatelessWidget {
  final Widget child;

  const DrawerAppBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/cat.jpg',
                    )),
                color: Colors.black87,
              ),
              child: null,
            ),
            ListTile(
              title: const Text('Список пользователей'),
              onTap: () {
                Navigator.pushNamed(context, Routes.userListPage);
              },
            ),
            ListTile(
              title: const Text('Посты'),
              onTap: () {
                Navigator.pushNamed(context, Routes.postsPage);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.personalPage);
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: child,
    );
  }
}
