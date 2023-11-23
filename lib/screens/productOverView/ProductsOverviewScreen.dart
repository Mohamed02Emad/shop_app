import 'package:flutter/material.dart';
import 'package:shop_app/data/providers/ProductsProvider.dart';
import 'package:shop_app/widgets/ProductItem.dart';

class ProductsOverViewScreen extends StatelessWidget {
  final listOfProducts = FakeProducts.getFakeProducts();

  ProductsOverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding:  const EdgeInsets.only(left: 12 , right: 12 , top: 20 , bottom: 20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 240,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: listOfProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(product : listOfProducts[index]);
        },
      ),
    );
  }
}
