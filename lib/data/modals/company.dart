class Company { // для хранения данных пользователя

  final String name;
  final String catchPhrase;
  final String bs;

  const Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  static Company fromJson(Map<String, dynamic> json) { //десериализация объекта; fromJson - это статич.метод
    // (статич.м.можно вызвать без создания объекта)
    return Company( //объект
      name: json['name'] as String,
      catchPhrase: json['catchPhrase'] as String,
      bs: json['bs'] as String,
    );
  }
}