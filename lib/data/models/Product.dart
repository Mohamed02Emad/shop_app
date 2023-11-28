import 'package:flutter/material.dart';
import 'package:shop_app/data/models/cart.dart';

class Product extends ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavorite(){
    isFavorite = !isFavorite;
    notifyListeners();
  }

  CartItem toCartItem() {
    return CartItem(
        id: CartItem.getNewId(),
        title: title,
        quantity: 1,
        price: price,
        imageUrl: imageUrl);
  }

  Product copy({
    String? id,
    String? title,
    String? description,
    double? price,
    String? imageUrl,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl.trim(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price.toString(),
      'imageUrl': imageUrl.trim(),
    };
  }

  static Product fromJson(String productId , Map<String, dynamic> json) {
    return Product(
      id: productId,
      title: json['title'],
      description: json['description'],
      price: double.parse(json['price']),
      imageUrl: json['imageUrl'].toString().trim(),
    );
  }
}
