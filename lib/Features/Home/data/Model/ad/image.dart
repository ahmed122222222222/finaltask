class Image {
  int? id;
  String? image;

  Image({this.id, this.image});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'] as int?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
      };
}
