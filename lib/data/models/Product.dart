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

  CartItem toCartItem(){
    return  CartItem(
      id: CartItem.getNewId(),
      title: title,
      quantity: 1,
      price: price,
      imageUrl: imageUrl
    );
  }

}
