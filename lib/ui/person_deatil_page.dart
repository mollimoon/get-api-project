import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/data/prefs_keys.dart';

import '../data/routes.dart';

enum MenuItems { about, logout }

class PersonDetailPage extends StatefulWidget {
  const PersonDetailPage({Key? key}) : super(key: key);

  @override
  State<PersonDetailPage> createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends State<PersonDetailPage> {
  late final SharedPreferences _prefs;
  String _login = '';

  @override
  void initState() {
    super.initState();

    Future(
      () async {
        _prefs = await SharedPreferences.getInstance();
        _login = _prefs.getString(PrefsKeys.login) ?? '';
        setState(() {});
      },
    );
  }

  MenuItems? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          PopupMenuButton<MenuItems>(
            initialValue: selectedMenu, // Callback that sets the selected popup menu item.
            onSelected: (MenuItems item){
             switch (item) {
               case MenuItems.about:
                 print('one!');
                 break;
               case MenuItems.logout:
                 Navigator.pushNamed(context, Routes.loginPage);
                 break;
             }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItems>>[
              const PopupMenuItem<MenuItems>(
                value: MenuItems.about,
                child: Text('О приложении'),
              ),
              const PopupMenuItem<MenuItems>(
                value: MenuItems.logout,
                child:  Text('Выход'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text('Вы вошли как $_login'),
      ),
    );
  }
}
