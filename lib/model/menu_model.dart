import 'dart:convert';

class MenuModel {
  int id;
  String name;
  String description;
  String hotel_name;
  String food_category_name;
  String food_type;
  String size_type;
  int original_price;
  int discounted_price;
  String image;
  int rating;
  
  MenuModel({
    required this.id,
    required this.name,
    required this.description,
    required this.hotel_name,
    required this.food_category_name,
    required this.food_type,
    required this.size_type,
    required this.original_price,
    required this.discounted_price,
    required this.image,
    required this.rating,
  });

  MenuModel copyWith({
    int? id,
    String? name,
    String? description,
    String? hotel_name,
    String? food_category_name,
    String? food_type,
    String? size_type,
    int? original_price,
    int? discounted_price,
    String? image,
    int? rating,
  }) {
    return MenuModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      hotel_name: hotel_name ?? this.hotel_name,
      food_category_name: food_category_name ?? this.food_category_name,
      food_type: food_type ?? this.food_type,
      size_type: size_type ?? this.size_type,
      original_price: original_price ?? this.original_price,
      discounted_price: discounted_price ?? this.discounted_price,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'hotel_name': hotel_name,
      'food_category_name': food_category_name,
      'food_type': food_type,
      'size_type': size_type,
      'original_price': original_price,
      'discounted_price': discounted_price,
      'image': image,
      'rating': rating,
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      hotel_name: map['hotel_name'] ?? '',
      food_category_name: map['food_category_name'] ?? '',
      food_type: map['food_type'] ?? '',
      size_type: map['size_type'] ?? '',
      original_price: map['original_price']?.toInt() ?? 0,
      discounted_price: map['discounted_price']?.toInt() ?? 0,
      image: map['image'] ?? '',
      rating: map['rating']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) => MenuModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MenuModel(id: $id, name: $name, description: $description, hotel_name: $hotel_name, food_category_name: $food_category_name, food_type: $food_type, size_type: $size_type, original_price: $original_price, discounted_price: $discounted_price, image: $image, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MenuModel &&
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.hotel_name == hotel_name &&
      other.food_category_name == food_category_name &&
      other.food_type == food_type &&
      other.size_type == size_type &&
      other.original_price == original_price &&
      other.discounted_price == discounted_price &&
      other.image == image &&
      other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      hotel_name.hashCode ^
      food_category_name.hashCode ^
      food_type.hashCode ^
      size_type.hashCode ^
      original_price.hashCode ^
      discounted_price.hashCode ^
      image.hashCode ^
      rating.hashCode;
  }
}
