import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data/models/cart.dart';
import 'package:shop_app/data/providers/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem _cartItem;
  final String productId;
  const CartItemWidget({required this.productId,required CartItem cartItem, super.key})
      : _cartItem = cartItem;

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context , listen: false);
    return Dismissible(
      key: ValueKey(_cartItem.id),
      onDismissed: (direction) {
        cart.removeCartItemById(productId);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Remove Item"),
              content: const Text("Do you want to remove this Item ?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          },
        );
      },
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete, color: Colors.white),
            SizedBox(
              width: 12,
            )
          ],
        ),
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: Colors.grey,
            )),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.network(_cartItem.imageUrl),
                ),
              ),
              Text("Name : ${_cartItem.title}"),
              const SizedBox(
                height: 2,
              ),
              Text("Quantity : ${_cartItem.quantity}"),
              const SizedBox(
                height: 2,
              ),
              Text(
                  "Total Price : ${(_cartItem.quantity * _cartItem.price).toStringAsFixed(2)} \$"),
            ],
          ),
        ),
      ),
    );
  }
}
