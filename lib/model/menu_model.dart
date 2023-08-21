import 'dart:convert';

class MenuModel {
  int id;
  int partner_id;
  String name;
  String description;
  String hotel_name;
  String food_category_name;
  String food_type;
  String size_type;
  int original_price;
  int discounted_price;
  int regular_original_price;
  int regular_discounted_price;
  int medium_original_price;
  int medium_discounted_price;
  int large_original_price;
  int large_discounted_price;
  String? image;
  int rating;
  int? cart_quantity;

  MenuModel({
    required this.id,
    required this.partner_id,
    required this.name,
    required this.description,
    required this.hotel_name,
    required this.food_category_name,
    required this.food_type,
    required this.size_type,
    required this.original_price,
    required this.discounted_price,
    required this.regular_original_price,
    required this.regular_discounted_price,
    required this.medium_original_price,
    required this.medium_discounted_price,
    required this.large_original_price,
    required this.large_discounted_price,
    this.image,
    required this.rating,
    this.cart_quantity,
  });

  MenuModel copyWith({
    int? id,
    int? partner_id,
    String? name,
    String? description,
    String? hotel_name,
    String? food_category_name,
    String? food_type,
    String? size_type,
    int? original_price,
    int? discounted_price,
    int? regular_original_price,
    int? regular_discounted_price,
    int? medium_original_price,
    int? medium_discounted_price,
    int? large_original_price,
    int? large_discounted_price,
    String? image,
    int? rating,
    int? cart_quantity,
  }) {
    return MenuModel(
      id: id ?? this.id,
      partner_id: partner_id ?? this.partner_id,
      name: name ?? this.name,
      description: description ?? this.description,
      hotel_name: hotel_name ?? this.hotel_name,
      food_category_name: food_category_name ?? this.food_category_name,
      food_type: food_type ?? this.food_type,
      size_type: size_type ?? this.size_type,
      original_price: original_price ?? this.original_price,
      discounted_price: discounted_price ?? this.discounted_price,
      regular_original_price: regular_original_price ?? this.regular_original_price,
      regular_discounted_price: regular_discounted_price ?? this.regular_discounted_price,
      medium_original_price: medium_original_price ?? this.medium_original_price,
      medium_discounted_price: medium_discounted_price ?? this.medium_discounted_price,
      large_original_price: large_original_price ?? this.large_original_price,
      large_discounted_price: large_discounted_price ?? this.large_discounted_price,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      cart_quantity: cart_quantity ?? this.cart_quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'partner_id': partner_id,
      'name': name,
      'description': description,
      'hotel_name': hotel_name,
      'food_category_name': food_category_name,
      'food_type': food_type,
      'size_type': size_type,
      'original_price': original_price,
      'discounted_price': discounted_price,
      'regular_original_price': regular_original_price,
      'regular_discounted_price': regular_discounted_price,
      'medium_original_price': medium_original_price,
      'medium_discounted_price': medium_discounted_price,
      'large_original_price': large_original_price,
      'large_discounted_price': large_discounted_price,
      'image': image,
      'rating': rating,
      'cart_quantity': cart_quantity,
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      id: map['id']?.toInt() ?? 0,
      partner_id: map['partner_id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      hotel_name: map['hotel_name'] ?? '',
      food_category_name: map['food_category_name'] ?? '',
      food_type: map['food_type'] ?? '',
      size_type: map['size_type'] ?? '',
      original_price: map['original_price']?.toInt() ?? 0,
      discounted_price: map['discounted_price']?.toInt() ?? 0,
      regular_original_price: map['regular_original_price']?.toInt() ?? 0,
      regular_discounted_price: map['regular_discounted_price']?.toInt() ?? 0,
      medium_original_price: map['medium_original_price']?.toInt() ?? 0,
      medium_discounted_price: map['medium_discounted_price']?.toInt() ?? 0,
      large_original_price: map['large_original_price']?.toInt() ?? 0,
      large_discounted_price: map['large_discounted_price']?.toInt() ?? 0,
      image: map['image'],
      rating: map['rating']?.toInt() ?? 0,
      cart_quantity: map['cart_quantity']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) =>
      MenuModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MenuModel(id: $id, partner_id: $partner_id, name: $name, description: $description, hotel_name: $hotel_name, food_category_name: $food_category_name, food_type: $food_type, size_type: $size_type, original_price: $original_price, discounted_price: $discounted_price, regular_original_price: $regular_original_price, regular_discounted_price: $regular_discounted_price, medium_original_price: $medium_original_price, medium_discounted_price: $medium_discounted_price, large_original_price: $large_original_price, large_discounted_price: $large_discounted_price, image: $image, rating: $rating, cart_quantity: $cart_quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MenuModel &&
      other.id == id &&
      other.partner_id == partner_id &&
      other.name == name &&
      other.description == description &&
      other.hotel_name == hotel_name &&
      other.food_category_name == food_category_name &&
      other.food_type == food_type &&
      other.size_type == size_type &&
      other.original_price == original_price &&
      other.discounted_price == discounted_price &&
      other.regular_original_price == regular_original_price &&
      other.regular_discounted_price == regular_discounted_price &&
      other.medium_original_price == medium_original_price &&
      other.medium_discounted_price == medium_discounted_price &&
      other.large_original_price == large_original_price &&
      other.large_discounted_price == large_discounted_price &&
      other.image == image &&
      other.rating == rating &&
      other.cart_quantity == cart_quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      partner_id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      hotel_name.hashCode ^
      food_category_name.hashCode ^
      food_type.hashCode ^
      size_type.hashCode ^
      original_price.hashCode ^
      discounted_price.hashCode ^
      regular_original_price.hashCode ^
      regular_discounted_price.hashCode ^
      medium_original_price.hashCode ^
      medium_discounted_price.hashCode ^
      large_original_price.hashCode ^
      large_discounted_price.hashCode ^
      image.hashCode ^
      rating.hashCode ^
      cart_quantity.hashCode;
  }
}
