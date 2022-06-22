import 'package:shop_app/models/get_fav_model/Product.dart';

class DataX {
  int? id;
  Product? product;

  DataX({this.id, this.product});

  factory DataX.fromJson(Map<String, dynamic> json) {
    return DataX(
      id: json['id'],
      product:
          json['product'] != null ? Product.fromJson(json['product']) : null,
    );
  }
}
