class Product {
  int? discount;
  int? id;
  String? image;
  dynamic oldPrice;
  dynamic price;

  Product({this.discount, this.id, this.image, this.oldPrice, this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      discount: json['discount'],
      id: json['id'],
      image: json['image'],
      oldPrice: json['old_price'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['discount'] = discount;
    data['id'] = id;
    data['image'] = image;
    data['old_price'] = oldPrice;
    data['price'] = price;
    return data;
  }
}
