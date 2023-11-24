// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:busenet/busenet.dart';

import 'package:flutter_onion_architecture/core/domain/common/entity.dart';

class Product implements BaseEntity<Product>, Entity {
  final String? name;
  final double? stock;
  final String? description;
  final double? price;

  Product({this.name, this.description, this.price, this.stock});

  @override
  Product fromJson(data) {
    return Product.fromMap(data);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
