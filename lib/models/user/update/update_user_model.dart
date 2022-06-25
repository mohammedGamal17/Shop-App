

import '../update/data.dart';

class UpdateUserModel {
   late Data? data;
   late String message;
   late bool status;

    UpdateUserModel({required this.data, required this.message, required this.status});

    factory UpdateUserModel.fromJson(Map<String, dynamic> json) {
        return UpdateUserModel(
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