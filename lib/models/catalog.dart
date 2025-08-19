// // ignore_for_file: public_member_api_docs, sort_constructors_first, null_closures
// import 'dart:convert';

// class CatalogModel {
//   static List<Item> items = [];

//   //get id by item
//   Item getById(int id) =>
//       items.firstWhere((element) => element.id == id, orElse: null);

//   //get Item by postion
//   Item getByPosition(int pos) => items[pos];
// }

// class Item {
//   final int id;
//   final String name;
//   final String desc;
//   final num price;
//   final String color;
//   final String image;

//   Item({
//     required this.id,
//     required this.name,
//     required this.desc,
//     required this.price,
//     required this.color,
//     required this.image,
//   });

//   Item copyWith({
//     String? id,
//     String? name,
//     String? desc,
//     num? price,
//     String? color,
//     String? image,
//   }) {
//     return Item(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       desc: desc ?? this.desc,
//       price: price ?? this.price,
//       color: color ?? this.color,
//       image: image ?? this.image,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'desc': desc,
//       'price': price,
//       'color': color,
//       'image': image,
//     };
//   }

//   factory Item.fromMap(Map<String, dynamic> map) {
//     return Item(
//       id: map['id'].toString(),
//       name: map['name'] ?? '',
//       desc: map['desc'] ?? '',
//       price: map['price'] ?? 0,
//       color: map['color'] ?? '#ffffff',
//       image: map['image'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Item.fromJson(String source) =>
//       Item.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
//   }

//   @override
//   bool operator ==(covariant Item other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.name == name &&
//         other.desc == desc &&
//         other.price == price &&
//         other.color == color &&
//         other.image == image;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         name.hashCode ^
//         desc.hashCode ^
//         price.hashCode ^
//         color.hashCode ^
//         image.hashCode;
//   }
// }
// ignore_for_file: public_member_api_docs, sort_constructors_first, null_closures
import 'dart:convert';

import 'package:flutter_catalog/models/cart.dart';

class CatalogModel {
  static final catModel = CatalogModel._internal();

  CatalogModel._internal();

  factory CatalogModel() => catModel;

  static List<Item> items = [];

  // get item by id
  Item? getById(int id) => items.firstWhere(
    (element) => element.id == id,
    orElse: () => Item.empty(),
  );

  // get item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  /// A default empty item (for safe returns in case not found)
  factory Item.empty() {
    return Item(
      id: -1,
      name: '',
      desc: '',
      price: 0,
      color: '#ffffff',
      image: '',
    );
  }

  Item copyWith({
    int? id, // 🔥 fixed (was String?)
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] is int
          ? map['id']
          : int.tryParse(map['id'].toString()) ?? 0, // 🔥 fixed
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      price: map['price'] ?? 0,
      color: map['color'] ?? '#ffffff',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
