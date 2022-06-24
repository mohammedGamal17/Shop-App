class Product {
  String? description;
  dynamic discount;
  late int id;
  String? image;
  List<String>? images;
  bool? inCart;
  late bool inFavorites;
  String? name;
  dynamic oldPrice;
  dynamic price;

  Product.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    discount = json['discount'];
    id = json['id'];
    image = json['image'];
    images = json['images'] != null ? List<String>.from(json['images']) : null;
    inCart = json['in_cart'];
    inFavorites = json['in_favorites'];
    name = json['name'];
    oldPrice = json['old_price'];
    price = json['price'];
  }
}
