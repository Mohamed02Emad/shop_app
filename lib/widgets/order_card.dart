import 'package:flutter/material.dart';
import 'package:shop_app/data/models/order.dart';
import 'package:shop_app/data/providers/orders_provider.dart';
import 'package:shop_app/utils/dateUtil.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    order.id,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                DateUtil.getFormattedDate(order.dateTime),
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Number of items: ${order.products.length}\n",
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            OrdersProvider.getAllItemsString(order),
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 17,
            ),
            maxLines: 6,
          ),
        ],
      ),
    );
  }
}
