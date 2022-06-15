class HomeModel1 {
  bool? status;
  HomeDataModel? data;

   HomeModel1.fromJson(Map<String, dynamic> json) {
      data: json['data'] != null ? HomeDataModel.fromJson(json['data']) : null;
      status: json['status'];
  }
}

class HomeDataModel {
  List<Banners>? banners = [];
  List<Products>? products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners?.add(element);
    });
    json['products'].forEach((element) {
      products?.add(element);
    });
  }
}

class Banners {
  int? id;
  String? image;

   Banners.fromJson(Map<String, dynamic> json) {
      id: json['id'];
      image: json['image'];
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

   Products.fromJson(Map<String, dynamic> json) {
      id: json['id'];
      price: json['price'];
      oldPrice: json['old_price'];
      discount: json['discount'];
      image: json['image'];
      name: json['name'];
      inFavorites: json['in_favorites'];
      inCart: json['in_cart'];
  }
}
