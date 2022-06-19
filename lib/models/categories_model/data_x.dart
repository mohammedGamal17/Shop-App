class DataX {
  int? id;
  String? name;
  String? image;

  DataX({this.id, this.name, this.image});

  factory DataX.fromJson(Map<String, dynamic> json) {
    return DataX(
      id : json['id'],
      name : json['name'],
      image : json['image'],
    );
  }
}
