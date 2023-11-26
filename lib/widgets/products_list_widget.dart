import 'package:flutter/material.dart';
import 'package:shop_app/data/models/Product.dart';
import 'package:shop_app/widgets/ProductItem.dart';

class ProductsList extends StatelessWidget {
  final List<Product> listOfProducts;
  const ProductsList({required this.listOfProducts ,super.key});

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      padding:
      const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 240,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: listOfProducts.length,
      itemBuilder: (context,index) {
        return ProductItem(product: listOfProducts[index]);
      },
    );
  }
}
