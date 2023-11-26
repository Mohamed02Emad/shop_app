import 'package:shop_app/data/models/Product.dart';

import 'package:flutter/material.dart';
import 'package:shop_app/data/providers/ProductsProvider.dart';

class Products extends ChangeNotifier {
  final List<Product> _items = FakeProducts.getFakeProducts();

  List<Product> get getItems => _items;

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}