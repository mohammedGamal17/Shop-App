import 'user_data.dart';

class ShopLoginModel {
  UserData? data;
  String? message;
  bool? status;

  ShopLoginModel({this.data, this.message, this.status});

  factory ShopLoginModel.fromJson(Map<String, dynamic> json) {
    return ShopLoginModel(
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
      message: json['message'],
      status: json['status'],
    );
  }

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }*/
}


