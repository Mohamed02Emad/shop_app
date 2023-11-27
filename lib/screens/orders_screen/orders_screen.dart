import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data/providers/orders_provider.dart';
import 'package:shop_app/widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  static String route = "/orders_screen";
  @override
  Widget build(BuildContext context) {
    var orderProvider = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Expanded(
          child: ListView.builder(
            itemCount: orderProvider.itemCount(),
            itemBuilder: (ctx, index) {
              return OrderCard(order: orderProvider.orders[index]);
            },
          ),
        ),
      ),
    );
  }
}
