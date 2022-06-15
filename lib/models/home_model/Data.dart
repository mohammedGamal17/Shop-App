import 'Banner.dart';
import 'Product.dart';

class Data {
  String? ad;
  List<Banner>? banners;
  List<Product>? products;

  Data({this.ad, this.banners, this.products});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      ad: json['ad'],
      banners: json['banners'] != null
          ? (json['banners'] as List).map((i) => Banner.fromJson(i)).toList()
          : null,
      products: json['products'] != null
          ? (json['products'] as List).map((i) => Product.fromJson(i)).toList()
          : null,
    );
  }
}
