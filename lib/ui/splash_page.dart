import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/data/routes.dart';

import '../data/prefs_keys.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();

    Future(
      () async => _prefs = await SharedPreferences.getInstance(),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(seconds: 4),
        () => _checkAuth(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CachedNetworkImage(
          imageUrl: 'https://www.androidbasement.com/images/posts/e5780398e55ff51051c733b53f88704e-0.jpg',
        ),
      ),
    );
  }

  void _checkAuth() {
    final login = _prefs.getString(PrefsKeys.login); //достаем значения
    final password = _prefs.getString(PrefsKeys.password); //достаем значения
    if (login != null && login.isNotEmpty && password != null && password.isNotEmpty) {
      Navigator.pushReplacementNamed(context, Routes.userListPage);
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginPage);
    }
  }
}
