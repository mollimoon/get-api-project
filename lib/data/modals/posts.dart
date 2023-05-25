class Post { // для хранения данных пользователя

  final String title;
  final String body;


  const Post({
    required this.title,
    required this.body,

  });

  static Post fromJson(Map<String, dynamic> json) { //десериализация объекта; fromJson - это статич.метод
    // (статич.м.можно вызвать без создания объекта)
    return Post( //объект
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}