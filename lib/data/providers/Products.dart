import 'package:flutter/material.dart';
import 'package:shop_app/data/models/Product.dart';
import 'package:shop_app/data/providers/ProductsProvider.dart';

class Products extends ChangeNotifier {
  final List<Product> _items = FakeProducts.getFakeProducts();


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
}