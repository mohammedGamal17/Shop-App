import 'package:shop_app/models/cart/add_cart/product.dart';

class Data {
  late int id;
  Product? product;
  late int quantity;

  Data({
    required this.id,
    this.product,
    required this.quantity,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      product:
          json['product'] != null ? Product.fromJson(json['product']) : null,
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataX = new Map<String, dynamic>();
    dataX['id'] = this.id;
    dataX['quantity'] = this.quantity;
    final product = this.product;
    if (product != null) {
      dataX['product'] = product.toJson();
    }
    return dataX;
  }
}
