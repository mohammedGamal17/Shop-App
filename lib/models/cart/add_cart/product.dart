class Product {
  late String description;
  late int discount;
  late int id;
  late String image;
  late String name;
  late int old_price;
  late int price;

  Product({
    required this.description,
    required this.discount,
    required this.id,
    required this.image,
    required this.name,
    required this.old_price,
    required this.price,
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
