import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/data/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/data/prefs_keys.dart';
import '../get_api_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  CachedNetworkImage(imageUrl: 'https://cdn-icons-png.flaticon.com/512/5087/5087579.png'),
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Введите логин';
                      }
                      if (text.length < 6) {
                        return 'Введите 6 и более символов';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    controller: _loginController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      labelText: 'Login',
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Введите пароль';
                      }
                      if (text.length < 6) {
                        return 'Введите 6 и более символов';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    onEditingComplete: _validateAndNavigate,
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(), fixedSize: const Size(120, 50), backgroundColor: Colors.black),
                    onPressed: _validateAndNavigate,
                    child: const Text('GO'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateAndNavigate() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, Routes.userListPage);
    }
  }

  // Future<void> _saveLogin(BuildContext context) async { // объявили ассинхр фун-ю
  //   await prefs.setString(PrefsKeys.login, _loginController.text);
  //   await prefs.setString(PrefsKeys.password, _passwordController.text);
  //   Navigator.pop(context);
  // }

}

