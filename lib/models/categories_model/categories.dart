import '../home_model/data.dart';

class Categories {
  bool? status;
  Object? message;
  Data? data;

  Categories({this.status, this.message, this.data});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
        status: json['status'],
        message : json['message'],
        data : json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}
