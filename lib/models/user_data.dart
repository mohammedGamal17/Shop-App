class UserData {
  int? credit;
  String? email;
  int? id;
  String? image;
  String? name;
  String? phone;
  int? points;
  String? token;
  String? password;

  UserData(
      {this.credit,
      this.email,
      this.id,
      this.image,
      this.name,
      this.phone,
      this.points,
      this.token,
      this.password});

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
      password: json['password'],
    );
  }
}
