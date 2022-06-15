import 'package:shop_app/generated/json/base/json_convert_content.dart';
import 'package:shop_app/models/home_entity.dart';

HomeEntity $HomeEntityFromJson(Map<String, dynamic> json) {
	final HomeEntity homeEntity = HomeEntity();
	final bool? status = jsonConvert.convert<bool>(json['status']);
	if (status != null) {
		homeEntity.status = status;
	}
	final dynamic? message = jsonConvert.convert<dynamic>(json['message']);
	if (message != null) {
		homeEntity.message = message;
	}
	final HomeData? data = jsonConvert.convert<HomeData>(json['data']);
	if (data != null) {
		homeEntity.data = data;
	}
	return homeEntity;
}

Map<String, dynamic> $HomeEntityToJson(HomeEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

HomeData $HomeDataFromJson(Map<String, dynamic> json) {
	final HomeData homeData = HomeData();
	final List<HomeDataBanners>? banners = jsonConvert.convertListNotNull<HomeDataBanners>(json['banners']);
	if (banners != null) {
		homeData.banners = banners;
	}
	final List<HomeDataProducts>? products = jsonConvert.convertListNotNull<HomeDataProducts>(json['products']);
	if (products != null) {
		homeData.products = products;
	}
	final String? ad = jsonConvert.convert<String>(json['ad']);
	if (ad != null) {
		homeData.ad = ad;
	}
	return homeData;
}

Map<String, dynamic> $HomeDataToJson(HomeData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['banners'] =  entity.banners?.map((v) => v.toJson()).toList();
	data['products'] =  entity.products?.map((v) => v.toJson()).toList();
	data['ad'] = entity.ad;
	return data;
}

HomeDataBanners $HomeDataBannersFromJson(Map<String, dynamic> json) {
	final HomeDataBanners homeDataBanners = HomeDataBanners();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		homeDataBanners.id = id;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		homeDataBanners.image = image;
	}
	final dynamic? category = jsonConvert.convert<dynamic>(json['category']);
	if (category != null) {
		homeDataBanners.category = category;
	}
	final dynamic? product = jsonConvert.convert<dynamic>(json['product']);
	if (product != null) {
		homeDataBanners.product = product;
	}
	return homeDataBanners;
}

Map<String, dynamic> $HomeDataBannersToJson(HomeDataBanners entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['image'] = entity.image;
	data['category'] = entity.category;
	data['product'] = entity.product;
	return data;
}

HomeDataProducts $HomeDataProductsFromJson(Map<String, dynamic> json) {
	final HomeDataProducts homeDataProducts = HomeDataProducts();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		homeDataProducts.id = id;
	}
	final int? price = jsonConvert.convert<int>(json['price']);
	if (price != null) {
		homeDataProducts.price = price;
	}
	final int? oldPrice = jsonConvert.convert<int>(json['old_price']);
	if (oldPrice != null) {
		homeDataProducts.oldPrice = oldPrice;
	}
	final int? discount = jsonConvert.convert<int>(json['discount']);
	if (discount != null) {
		homeDataProducts.discount = discount;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		homeDataProducts.image = image;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		homeDataProducts.name = name;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		homeDataProducts.description = description;
	}
	final List<String>? images = jsonConvert.convertListNotNull<String>(json['images']);
	if (images != null) {
		homeDataProducts.images = images;
	}
	final bool? inFavorites = jsonConvert.convert<bool>(json['in_favorites']);
	if (inFavorites != null) {
		homeDataProducts.inFavorites = inFavorites;
	}
	final bool? inCart = jsonConvert.convert<bool>(json['in_cart']);
	if (inCart != null) {
		homeDataProducts.inCart = inCart;
	}
	return homeDataProducts;
}

Map<String, dynamic> $HomeDataProductsToJson(HomeDataProducts entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['price'] = entity.price;
	data['old_price'] = entity.oldPrice;
	data['discount'] = entity.discount;
	data['image'] = entity.image;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['images'] =  entity.images;
	data['in_favorites'] = entity.inFavorites;
	data['in_cart'] = entity.inCart;
	return data;
}