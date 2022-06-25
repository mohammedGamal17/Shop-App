import 'package:shop_app/models/favorites/get_fav_model/data.dart';

class GetFavModel {
  Data? data;
  String ?message;
  bool? status;

  GetFavModel({this.data, this.message, this.status});

  factory GetFavModel.fromJson(Map<String, dynamic> json) {
    return GetFavModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      status: json['status'],
      message: json['message'],
    );
  }
}
