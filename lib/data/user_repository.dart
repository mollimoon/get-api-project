import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:untitled2/data/api_constants.dart';
import 'package:untitled2/data/user.dart';

class UserRepository {
  Future<List<User>> getUsers() async {
    final url = Uri.parse(ApiConstants.getUsers); //парсим в uri-объект
    final response = await http.get(url); //использ его для get-запроса

    if (response.statusCode == 200) {
      final jsonString = response.body; // получение body-ответа
      final json = jsonDecode(jsonString); //преобраз-е body из String в объект

      final usersList = <User>[];

      for (final item in json) {
        final user = User.fromJson(item); // конверт-ция mар в тип user
        usersList.add(user); //наполняем лист usersList
      }

      return usersList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }
}
