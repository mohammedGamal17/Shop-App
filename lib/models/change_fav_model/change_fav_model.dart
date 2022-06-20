import 'package:shop_app/models/change_fav_model/data.dart';

class ChangeFavModel {
  Data? data;
  String? message;
  bool? status;

  ChangeFavModel({this.data, this.message, this.status});

  factory ChangeFavModel.fromJson(Map<String, dynamic> json) {
    return ChangeFavModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    final dataX = this.data;
    if (dataX != null) {
      data['data'] = dataX.toJson();
    }
    return data;
  }
}
