class Product {
  late String description;
  late dynamic discount;
  late int id;
  late String image;
  late List<String>? images;
  late bool inCart;
  late bool inFavorites;
  late String name;
  late dynamic oldPrice;
  late dynamic price;

  Product({
    required this.description,
    this.discount,
    required this.id,
    required this.image,
    required this.images,
    required this.inCart,
    required this.inFavorites,
    required this.name,
    this.oldPrice,
    this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      description: json['description'],
      discount: json['discount'],
      id: json['id'],
      image: json['image'],
      images:
          json['images'] != null ? new List<String>.from(json['images']) : null,
      inCart: json['in_cart'],
      inFavorites: json['in_favorites'],
      name: json['name'],
      oldPrice: json['old_price'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['discount'] = this.discount;
    data['id'] = this.id;
    data['image'] = this.image;
    data['in_cart'] = this.inCart;
    data['in_favorites'] = this.inFavorites;
    data['name'] = this.name;
    data['old_price'] = this.oldPrice;
    data['price'] = this.price;
    if (this.images != null) {
      data['images'] = this.images;
    }
    return data;
  }
}
