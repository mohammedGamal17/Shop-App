class Product {
  int? id;
  String? image;
  String? name;
  String? description;
  dynamic discount;
  dynamic old_price;
  dynamic price;

  Product({
    this.description,
    this.discount,
    this.id,
    this.image,
    this.name,
    this.old_price,
    this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      description: json['description'],
      discount: json['discount'],
      id: json['id'],
      image: json['image'],
      name: json['name'],
      old_price: json['old_price'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['discount'] = this.discount;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['old_price'] = this.old_price;
    data['price'] = this.price;
    return data;
  }
}
