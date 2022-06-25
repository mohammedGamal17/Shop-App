class Data {
  late int id;
  late String token;

  Data({required this.id, required this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['token'] = token;
    return data;
  }
}
