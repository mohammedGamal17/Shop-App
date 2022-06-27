import '../register/data.dart';

class RegisterModel {
  Data? data;
  String message;
  bool status;

  RegisterModel({required this.data, required this.message, required this.status});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataX = <String, dynamic>{};
    dataX['message'] = message;
    dataX['status'] = status;
    final data = this.data;
    if (data != null) {
      dataX['data'] = data.toJson();
    }
    return dataX;
  }
}
