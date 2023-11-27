import 'package:flutter/material.dart';
import 'package:shop_app/data/models/cart.dart';
import 'package:shop_app/data/models/order.dart';

class OrdersProvider extends ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return _orders;
  }

  static int orderId = 0;

  int itemCount() => _orders.length;

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

  static String getAllItemsString(Order order) {
    var string = "";
    order.products.forEach((item) {
      string += "Quantity: ${item.quantity} , Name: ${item.title}\n";
    });
    return string;
  }
}
