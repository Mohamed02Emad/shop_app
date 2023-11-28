import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data/models/Product.dart';
import 'package:shop_app/utils/networkHelper.dart';

import '../data/providers/Products.dart';

class YourProductItem extends StatefulWidget {
  final Product product;

  const YourProductItem({required this.product, super.key});

  @override
  State<YourProductItem> createState() => _YourProductItemState();
}

class _YourProductItemState extends State<YourProductItem> {
  late Products products;

  @override
  Widget build(BuildContext context) {
    products = Provider.of<Products>(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          )),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.product.imageUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(widget.product.title),
            const Spacer(),
            IconButton(
              onPressed: () {
                deleteProduct();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteProduct() {
    showDialog(
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
    ).then((isDelete) {
      if (isDelete) {
        NetworkHelper.deleteProducts("products/", widget.product.id.trim())
            .then((response) {
          if (response?.statusCode == 200) {
            products.remove(widget.product);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Error"),
              duration: Duration(seconds: 1),
            ));
          }
        });
      }
    });
  }
}
