import 'package:shop_app/models/favorites/change_fav_model/product.dart';

class Data {
  int? id;
  Product? product;

  Data({this.id, this.product});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      product:
          json['product'] != null ? Product.fromJson(json['product']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    final product = this.product;
    if (product != null) {
      data['product'] = product.toJson();
    }
    return data;
  }
}
