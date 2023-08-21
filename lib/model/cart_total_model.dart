import 'dart:convert';

class CartTotalModel {
  int id;
  int sub_amount;
  int amount;
  int shipping_price;
  CartTotalModel({
    required this.id,
    required this.sub_amount,
    required this.amount,
    required this.shipping_price,
  });

  CartTotalModel copyWith({
    int? id,
    int? sub_amount,
    int? amount,
    int? shipping_price,
  }) {
    return CartTotalModel(
      id: id ?? this.id,
      sub_amount: sub_amount ?? this.sub_amount,
      amount: amount ?? this.amount,
      shipping_price: shipping_price ?? this.shipping_price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sub_amount': sub_amount,
      'amount': amount,
      'shipping_price': shipping_price,
    };
  }

  factory CartTotalModel.fromMap(Map<String, dynamic> map) {
    return CartTotalModel(
      id: map['id']?.toInt() ?? 0,
      sub_amount: map['sub_amount']?.toInt() ?? 0,
      amount: map['amount']?.toInt() ?? 0,
      shipping_price: map['shipping_price']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartTotalModel.fromJson(String source) => CartTotalModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartTotalModel(id: $id, sub_amount: $sub_amount, amount: $amount, shipping_price: $shipping_price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CartTotalModel &&
      other.id == id &&
      other.sub_amount == sub_amount &&
      other.amount == amount &&
      other.shipping_price == shipping_price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      sub_amount.hashCode ^
      amount.hashCode ^
      shipping_price.hashCode;
  }
}
