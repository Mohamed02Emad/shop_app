import 'package:flutter/foundation.dart';
import 'package:shop_app/data/models/cart.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return _cartItems;
  }

  void addItem(String productId, CartItem cartItem) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          quantity: value.quantity + 1,
          price: value.price,
          imageUrl: value.imageUrl,
        ),
      );
    } else {
      _cartItems.putIfAbsent(productId, () => cartItem);
    }
    notifyListeners();
  }

  int get itemCount {
    return _cartItems.length;
  }

  bool isProductInCart(String productId) {
    return _cartItems.containsKey(productId);
  }

  String getTotalPrice() {
    double totalPrice = 0;
    _cartItems.forEach((key, item) {
      totalPrice += (item.price * item.quantity);
    });
    return totalPrice.toStringAsFixed(2);
  }

  double getTotalPriceAsDouble() {
    double totalPrice = 0;
    _cartItems.forEach((key, item) {
      totalPrice += (item.price * item.quantity);
    });
    return double.parse(totalPrice.toStringAsFixed(2));
  }

  CartItem getCartByIndex(int index) {
    var list = _cartItems.values.toList();
    return list[index];
  }

  void removeCartItemById(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  String getCartKey(int index) {
    return _cartItems.keys.toList()[index];
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  List<CartItem> getCartItems() => _cartItems.values.toList();
}
