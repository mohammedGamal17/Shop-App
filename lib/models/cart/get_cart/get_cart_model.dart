import 'package:shop_app/models/cart/get_cart/data.dart';

class GetCartModel {
  Data? data;
  late bool status;

  GetCartModel({
    this.data,
    required this.status,
  });

  factory GetCartModel.fromJson(Map<String, dynamic> json) {
    return GetCartModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataX = new Map<String, dynamic>();
    dataX['status'] = this.status;
    final data = this.data;
    if (data != null) {
      dataX['data'] = data.toJson();
    }
    return dataX;
  }
}
