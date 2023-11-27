import 'package:flutter/material.dart';
import 'package:shop_app/data/models/cart.dart';
import 'package:shop_app/data/models/order.dart';

class OrdersProvider extends ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return _orders;
  }

  static int orderId = 0;

  void addOrder(List<CartItem> cartProducts, double total) {
    orderId++;
    _orders.insert(
      0,
      Order(
        id: orderId.toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
