import '../../user/logout/data.dart';

class Logout {
  Data? data;
  String? message;
  bool? status;

  Logout({this.data, this.message, this.status});

  factory Logout.fromJson(Map<String, dynamic> json) {
    return Logout(
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
