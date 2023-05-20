import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/ui/card_detail_page.dart';
import 'package:untitled2/ui/login_page.dart';
import 'package:untitled2/ui/person_deatil_page.dart';
import 'package:untitled2/ui/splash_page.dart';
import 'package:untitled2/ui/users_list_page.dart';
import 'data/routes.dart';



class GetApiApp extends StatelessWidget {
  const GetApiApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.black,
      ),
      routes: {
        Routes.splashPage: (context) => const SplashPage(),
        Routes.loginPage: (context) => const LoginPage(),
        Routes.cardDetail: (context) => const CardDetailPage(),
        Routes.userListPage: (context) => const UsersListPage(),
        Routes.personalPage:(context) => const PersonDetailPage(),
      },
    );
  }
}