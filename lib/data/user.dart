class User {
  final int id;
  final String name;
  final String username;
  final String email;

  const User({
    required this.name,
    required this.username,
    required this.email,
    required this.id,
  });

  static User fromJson(Map<String, dynamic> json) { //десериализация объекта
    return User(
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      id: json['id'] as int,
    );
  }
}
