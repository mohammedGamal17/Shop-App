import 'cart_item.dart';

class Data {
  List<CartItem>? cart_items;
  late dynamic sub_total;
  late dynamic total;

  Data({
    this.cart_items,
    this.sub_total,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      cart_items: json['cart_items'] != null
          ? (json['cart_items'] as List)
              .map((i) => CartItem.fromJson(i))
              .toList()
          : null,
      sub_total: json['sub_total'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_total'] = this.sub_total;
    data['total'] = this.total;
    final cart_items = this.cart_items;
    if (cart_items != null) {
      data['cart_items'] = cart_items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
