import '../get_cart/product.dart';

class CartItem {
  late int id;
  Product? product;
  late int quantity;

  CartItem({
    required this.id,
    this.product,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
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
