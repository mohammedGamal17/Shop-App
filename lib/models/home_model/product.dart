class Product {
  String? description;
  dynamic discount;
  int? id;
  String? image;
  List<String>? images;
  bool? inCart;
  bool? inFavorites;
  String? name;
  dynamic oldPrice;
  dynamic price;

  Product(
      {this.description,
      this.discount,
      this.id,
      this.image,
      this.images,
      this.inCart,
      this.inFavorites,
      this.name,
      this.oldPrice,
      this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
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
}
