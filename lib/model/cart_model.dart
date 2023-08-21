import 'dart:convert';

class CartModel {
  int id;
  int menu_id;
  String customer_id;
  int partner_id;
  int quantity;
  String menu_name;
  String menu_image;
  int menu_price;
  String uploaded_from;
  String size;
  String created_at;
  String updated_at;
  String hotel_name;
  CartModel({
    required this.id,
    required this.menu_id,
    required this.customer_id,
    required this.partner_id,
    required this.quantity,
    required this.menu_name,
    required this.menu_image,
    required this.menu_price,
    required this.uploaded_from,
    required this.size,
    required this.created_at,
    required this.updated_at,
    required this.hotel_name,
  });

  CartModel copyWith({
    int? id,
    int? menu_id,
    String? customer_id,
    int? partner_id,
    int? quantity,
    String? menu_name,
    String? menu_image,
    int? menu_price,
    String? uploaded_from,
    String? size,
    String? created_at,
    String? updated_at,
    String? hotel_name,
  }) {
    return CartModel(
      id: id ?? this.id,
      menu_id: menu_id ?? this.menu_id,
      customer_id: customer_id ?? this.customer_id,
      partner_id: partner_id ?? this.partner_id,
      quantity: quantity ?? this.quantity,
      menu_name: menu_name ?? this.menu_name,
      menu_image: menu_image ?? this.menu_image,
      menu_price: menu_price ?? this.menu_price,
      uploaded_from: uploaded_from ?? this.uploaded_from,
      size: size ?? this.size,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      hotel_name: hotel_name ?? this.hotel_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'menu_id': menu_id,
      'customer_id': customer_id,
      'partner_id': partner_id,
      'quantity': quantity,
      'menu_name': menu_name,
      'menu_image': menu_image,
      'menu_price': menu_price,
      'uploaded_from': uploaded_from,
      'size': size,
      'created_at': created_at,
      'updated_at': updated_at,
      'hotel_name': hotel_name,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id']?.toInt() ?? 0,
      menu_id: map['menu_id']?.toInt() ?? 0,
      customer_id: map['customer_id'] ?? '',
      partner_id: map['partner_id']?.toInt() ?? 0,
      quantity: map['quantity']?.toInt() ?? 0,
      menu_name: map['menu_name'] ?? '',
      menu_image: map['menu_image'] ?? '',
      menu_price: map['menu_price']?.toInt() ?? 0,
      uploaded_from: map['uploaded_from'] ?? '',
      size: map['size'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      hotel_name: map['hotel_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartModel(id: $id, menu_id: $menu_id, customer_id: $customer_id, partner_id: $partner_id, quantity: $quantity, menu_name: $menu_name, menu_image: $menu_image, menu_price: $menu_price, uploaded_from: $uploaded_from, size: $size, created_at: $created_at, updated_at: $updated_at, hotel_name: $hotel_name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartModel &&
        other.id == id &&
        other.menu_id == menu_id &&
        other.customer_id == customer_id &&
        other.partner_id == partner_id &&
        other.quantity == quantity &&
        other.menu_name == menu_name &&
        other.menu_image == menu_image &&
        other.menu_price == menu_price &&
        other.uploaded_from == uploaded_from &&
        other.size == size &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.hotel_name == hotel_name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        menu_id.hashCode ^
        customer_id.hashCode ^
        partner_id.hashCode ^
        quantity.hashCode ^
        menu_name.hashCode ^
        menu_image.hashCode ^
        menu_price.hashCode ^
        uploaded_from.hashCode ^
        size.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        hotel_name.hashCode;
  }
}
