class UserData {
  int? credit;
  String? email;
  int? id;
  String? image;
  String? name;
  String? phone;
  int? points;
  String? token;

  UserData(
      {this.credit,
      this.email,
      this.id,
      this.image,
      this.name,
      this.phone,
      this.points,
      this.token});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
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

  /*Map<String, dynamic> toJson() {
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
  }*/
}
