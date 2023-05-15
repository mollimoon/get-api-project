class AvatarPhoto {
  final String urlPhoto;

  const AvatarPhoto({required this.urlPhoto});

  static AvatarPhoto fromJson(Map<String, dynamic> json) {
    return AvatarPhoto(
      urlPhoto: json['url'] as String,
    );
  }
}
