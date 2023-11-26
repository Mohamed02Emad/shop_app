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
      body: const Center(
          child: Text(
            "ProductDetailScreen",
            style: TextStyle(color: Colors.deepOrange),
          ),
        ),
    );
  }
}
