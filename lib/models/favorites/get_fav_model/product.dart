class Product {
  String? description;
  dynamic discount;
  late int id;
  String? image;
  String? name;
  dynamic oldPrice;
  dynamic price;

  Product.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    discount = json['discount'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    oldPrice = json['old_price'];
    price = json['price'];
  }
}
