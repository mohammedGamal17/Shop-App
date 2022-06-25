import '../Data.dart';

class GetProfile {
  Data? data;
  late bool status;

  GetProfile({this.data, required this.status});

  factory GetProfile.fromJson(Map<String, dynamic> json) {
    return GetProfile(
      data: json['`data`'] != null ? Data.fromJson(json['`data`']) : null,
      status: json['status'],
    );
  }
}
