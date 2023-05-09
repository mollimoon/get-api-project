import 'package:untitled2/data/company.dart';

class User { // для хранения данных пользователя
  final int id; //поля класса
  final String name;
  final String username;
  final String email;
  final Company company;


  const User({
    required this.name,
    required this.username,
    required this.email,
    required this.id,
    required this.company,

  });

  static User fromJson(Map<String, dynamic> json) { //десериализация объекта; fromJson - это статич.метод
    // (статич.м.можно вызвать без создания объекта)
    return User( //объект
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      id: json['id'] as int,
      company: Company.fromJson(json['company']),
    );
  }
}
