import '../register/data.dart';

class Register {
  Data? data;
  String message;
  bool status;

  Register({required this.data, required this.message, required this.status});

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
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
