import 'package:shop_app/models/get_fav_model/Data.dart';

class GetFavModel {
  Data? data;
  dynamic message;
  bool? status;

  GetFavModel({this.data, this.message, this.status});

  factory GetFavModel.fromJson(Map<String, dynamic> json) {
    return GetFavModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      status: json['status'],
    );
  }
}
