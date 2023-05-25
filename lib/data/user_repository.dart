import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:untitled2/data/api_constants.dart';
import 'package:untitled2/data/modals/avatar_photo.dart';
import 'package:untitled2/data/modals/user.dart';

import 'modals/posts.dart';


class UserRepository { // чтобы инкапсулировать логику получения данных из api
  Future<List<User>> getUsers() async {
    final url = Uri.parse(ApiConstants.getUsers); //парсим в uri-объект
    final response = await http.get(url); // результат выполн-я get-запроса по указанной url
    //в виде объекта response

    if (response.statusCode == 200) {
      final jsonString = response.body; // получение тела ответа
      final json = jsonDecode(jsonString); //преобраз-е body из String в список map-объектов (инфо из api)

      final usersList = <User>[];

      for (final item in json) {
        final user = User.fromJson(item); // конверт-ция mар в тип user (См.user.dart)
        usersList.add(user); //наполняем лист usersList
      }

      return usersList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }


  Future <List<AvatarPhoto>> getAvatarPicture() async {
    final url = Uri.parse(ApiConstants.getAvatarPicture);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonString = response.body;
      final json = jsonDecode(jsonString);

      final avatarList = <AvatarPhoto>[];

      for (final item in json) {
        final avatar = AvatarPhoto.fromJson(item);
        avatarList.add(avatar);
      }

      return avatarList;
    } else {
      throw Exception('Failed to load');
    }

  }

  Future <List<Post>> getPosts() async {
    final url = Uri.parse(ApiConstants.getPosts);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonString = response.body;
      final json = jsonDecode(jsonString);

      final postsList = <Post>[];

      for (final item in json) {
        final post = Post.fromJson(item);
        postsList.add(post);
      }

      return postsList;
    } else {
      throw Exception('Failed to load');
    }

  }

}
