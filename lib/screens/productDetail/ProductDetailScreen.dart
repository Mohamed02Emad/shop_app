import 'package:flutter/material.dart';
import 'package:shop_app/data/models/Product.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});
  static const routeName = '/product_detail';
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
     final product = ModalRoute.of(context)!.settings.arguments as Product;
    return const Scaffold(
      body: Center(
        child: Text(
          "ProductDetailScreen",
          style: TextStyle(
            color: Colors.deepOrange
          ),
        ),
      ),
    );
  }
}
