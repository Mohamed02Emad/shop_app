import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data/providers/Products.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  static const routeName = '/product_detail';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final product = Provider.of<Products>(context).findById(productId);

    return  Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Name : ${product.title}",
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(width: 300,height : 300,child: Image.network(product.imageUrl, fit: BoxFit.cover)),
            const SizedBox(
              height: 4,
            ),
            Text(
              "${product.description}",
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "price : ${product.price} \$",
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
