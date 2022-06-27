class Data {
  late String email;
  late int id;
  late String image;
  late String password;
  late String name;
  late String phone;
  late String token;

  Data(
      {required this.email,
      required this.password,
      required this.id,
      required this.image,
      required this.name,
      required this.phone,
      required this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      email: json['email'],
      id: json['id'],
      image: json['image'],
      name: json['name'],
      phone: json['phone'],
      token: json['token'],
      password: 'password',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['phone'] = phone;
    data['token'] = token;
    data['password'] = password;
    return data;
  }
}
