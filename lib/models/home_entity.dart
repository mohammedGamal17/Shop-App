import 'dart:convert';
import 'package:shop_app/generated/json/base/json_field.dart';
import 'package:shop_app/generated/json/home_entity.g.dart';

class HomeEntity {
  bool? status;
  HomeData? data;

  HomeEntity();

  factory HomeEntity.fromJson(Map<String, dynamic> json) =>
      $HomeEntityFromJson(json);

  Map<String, dynamic> toJson() => $HomeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class HomeData {
  List<HomeDataBanners>? banners;
  List<HomeDataProducts>? products;
  String? ad;

  HomeData();

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      $HomeDataFromJson(json);

  Map<String, dynamic> toJson() => $HomeDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class HomeDataBanners {
  int? id;
  String? image;
  dynamic category;
  dynamic product;

  HomeDataBanners();

  factory HomeDataBanners.fromJson(Map<String, dynamic> json) =>
      $HomeDataBannersFromJson(json);

  Map<String, dynamic> toJson() => $HomeDataBannersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class HomeDataProducts {
  int? id;
  int? price;
  @JSONField(name: "old_price")
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  @JSONField(name: "in_favorites")
  bool? inFavorites;
  @JSONField(name: "in_cart")
  bool? inCart;

  HomeDataProducts();

  factory HomeDataProducts.fromJson(Map<String, dynamic> json) =>
      $HomeDataProductsFromJson(json);

  Map<String, dynamic> toJson() => $HomeDataProductsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
