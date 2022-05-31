class LoginModel {
  String? status;
  String? message;
  UserModel? data;

  LoginModel.fromJson(
    Map<String, dynamic> jsonData,
  ) {
    status = jsonData['status'];
    message = jsonData['message'];
    data =
        jsonData['data'] != null ? UserModel.fromJson(jsonData['data']) : null;
  }
}

class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  //named constructor

  UserModel.fromJson(
    Map<String, dynamic> jsonData,
  ) {
    id = jsonData['id'];
    name = jsonData['name'];
    email = jsonData['email'];
    phone = jsonData['phone'];
    image = jsonData['image'];
    points = jsonData['points'];
    credit = jsonData['credit'];
    token = jsonData['token'];
  }
}
