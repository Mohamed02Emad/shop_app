import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data/providers/cart_provider.dart';
import 'package:shop_app/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static var route = "/cart_screen";

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text("${cart.getTotalPrice()} \$"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Order Now"),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, index) => CartItemWidget(
                productId: cart.getCartKey(index),
                cartItem: cart.getCartByIndex(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
