class Geo {

  final double lat;
  final double lng;

  const Geo({
    required this.lat,
    required this.lng,

  });

  static Geo fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: double.parse(json['lat']), ///TODO под инфо о пользователе (карточка) кнопка "посмотреть на карте" и по клику
      ///открывать карта телефона и выставляться маркер на карте
      lng: double.parse(json['lng']),
    );
  }
}