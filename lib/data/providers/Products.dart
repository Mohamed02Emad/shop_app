import './ProductsProvider.dart';
import '../models/Product.dart';
import 'package:flutter/material.dart';
class Products with ChangeNotifier{
  final List<Product> _items = FakeProducts.getFakeProducts();

  List<Product> getItems(){
    return [..._items];
  }

  void addProduct(Product){
    _items.add(Product);
    notifyListeners();
  }

}