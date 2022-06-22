class Product {
  String? description;
  dynamic discount;
  int? id;
  String? image;
  String? name;
  dynamic oldPrice;
  dynamic price;

  Product(
      {this.description,
      this.discount,
      this.id,
      this.image,
      this.name,
      this.oldPrice,
      this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      description: json['description'],
      discount: json['discount'],
      id: json['id'],
      image: json['image'],
      name: json['name'],
      oldPrice: json['old_price'],
      price: json['price'],
    );
  }
}
