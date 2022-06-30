import 'package:shop_app/models/cart/add_cart/data.dart';

class AddCartModel {
  Data? data;
  late String message;
  late bool status;

  AddCartModel({
    this.data,
    required this.message,
    required this.status,
  });

  factory AddCartModel.fromJson(Map<String, dynamic> json) {
    return AddCartModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataX = new Map<String, dynamic>();
    dataX['message'] = this.message;
    dataX['status'] = this.status;
    final data = this.data;
    if (data != null) {
      dataX['data'] = data.toJson();
    }
    return dataX;
  }
}
