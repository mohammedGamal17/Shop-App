class HomeModel {
  bool? status;
  HomeDataModel? data;

  HomeModel({this.status, this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      data: json['data'] != null ? HomeDataModel.fromJson(json['data']) : null,
      status: json['status'],
    );
  }
}

class HomeDataModel {
  List<Banners>? banners = [];
  List<Products>? products = [];

  HomeDataModel({this.banners, this.products});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((value) {
      banners?.add(value);
    });
    json['products'].forEach((value) {
      products?.add(value);
    });
  }
}

class Banners {
  int? id;
  String? image;

  Banners({this.id, this.image});

  factory Banners.fromJson(Map<String, dynamic> json) {
    return Banners(
      id: json['id'],
      image: json['image'],
    );
  }
}

class Products {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  bool? inFavorites;
  bool? inCart;

  Products(
      {this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      this.name,
      this.inFavorites,
      this.inCart});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
