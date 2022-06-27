import '../search/data.dart';

class Search {
  Data? data;
  bool? status;

  Search({this.data, this.status});

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
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
