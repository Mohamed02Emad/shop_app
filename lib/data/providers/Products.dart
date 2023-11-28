import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/data/models/Product.dart';

class Products extends ChangeNotifier {
  // final List<Product> _items = FakeProducts.getFakeProducts();
  final List<Product> _items = [];

  List<Product> get getItems {
    return _items;
  }

  List<Product> get getFavouriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void toggleFavouriteOfId(String id) {
    var index =
        _items.indexOf(_items.firstWhere((element) => element.id == id));
    var updatedProduct = _items[index];
    updatedProduct.isFavorite = !updatedProduct.isFavorite;
    _items[index] = updatedProduct;
    notifyListeners();
  }

  void addAllFromJson(String jsonResponse) {
    try {
      var map = json.decode(jsonResponse) as Map<String, dynamic>;
      map.forEach((key, value) {
        var product = Product.fromJson(key,value);
        _items.add(product);
      });
      notifyListeners();
    } catch (e) {
      print("Mohamed $e");
    }
  }

   void clearAll(){
    _items.clear();
    notifyListeners();
  }

  void remove(Product product) {
    _items.remove(product);
    notifyListeners();
  }
}