import '../search/data.dart';

class SearchModel {
  Data? data;
  bool? status;

  SearchModel({this.data, this.status});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataX = <String, dynamic>{};
    dataX['status'] = status;
    final data = this.data;
    if (data != null) {
      dataX['data'] = data.toJson();
    }
    return dataX;
  }
}
