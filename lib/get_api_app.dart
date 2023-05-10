import 'package:flutter/material.dart';
import 'package:untitled2/ui/card_detail.dart';
import 'package:untitled2/ui/users_list_page.dart';
import 'data/routes.dart';



class GetApiApp extends StatelessWidget {
  const GetApiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Routes.main: (context) => const UsersListPage(title: ''),
        Routes.cardDetail: (context) => const CardDetail(),
      },
    );
  }
}