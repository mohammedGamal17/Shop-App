class DataX {
  late String description;
  late dynamic discount;
  late int id;
  late String image;
  List<String>? images;
  late bool inCart;
  late bool inFavorites;
  late String name;
  late dynamic oldPrice;
   dynamic price;

  DataX(
      {required this.description,
      required this.discount,
      required this.id,
      required this.image,
      this.images,
      required this.inCart,
      required this.inFavorites,
      required this.name,
      required this.oldPrice,
      required this.price});

  factory DataX.fromJson(Map<String, dynamic> json) {
    return DataX(
      description: json['description'],
      discount: json['discount'],
      id: json['id'],
      image: json['image'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      inCart: json['in_cart'],
      inFavorites: json['in_favorites'],
      name: json['name'],
      oldPrice: json['old_price'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['discount'] = discount;
    data['id'] = id;
    data['image'] = image;
    data['in_cart'] = inCart;
    data['in_favorites'] = inFavorites;
    data['name'] = name;
    data['old_price'] = oldPrice;
    data['price'] = price;
    if (images != null) {
      data['images'] = images;
    }
    return data;
  }
}
