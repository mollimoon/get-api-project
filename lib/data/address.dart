import 'geo.dart';

class Address { // для хранения данных пользователя

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  static Address fromJson(Map<String, dynamic> json) { //десериализация объекта; fromJson - это статич.метод
    // (статич.м.можно вызвать без создания объекта)
    return Address( //объект
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      geo: Geo.fromJson(json['geo']),
    );
  }
}