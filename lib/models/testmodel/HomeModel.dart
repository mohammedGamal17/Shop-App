import 'Data.dart';

class HomeModel {
  Data? data;
  bool? status;

  HomeModel({this.data, this.status});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      status: json['status'],
    );
  }
}
