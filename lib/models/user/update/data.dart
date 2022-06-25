class Data {
  late int credit;
  late String email;
  late int id;
  late String image;
  late String name;
  late String phone;
  late int points;
  late String token;

  Data(
      {required this.credit,
      required this.email,
      required this.id,
      required this.image,
      required this.name,
      required this.phone,
      required this.points,
      required this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      credit: json['credit'],
      email: json['email'],
      id: json['id'],
      image: json['image'],
      name: json['name'],
      phone: json['phone'],
      points: json['points'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['credit'] = credit;
    data['email'] = email;
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['phone'] = phone;
    data['points'] = points;
    data['token'] = token;
    return data;
  }
}
