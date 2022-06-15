class Banner {
  int? id;
  String? image;

  Banner({
    this.id,
    this.image,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'],
      image: json['image'],
    );
  }
}
