import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/ProductItem.dart';

import '../../data/providers//Products.dart';

class ProductsOverViewScreen extends StatefulWidget {
  const ProductsOverViewScreen({super.key});

  @override
  State<ProductsOverViewScreen> createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store"),
        centerTitle: true,
      ),
      body: Consumer<Products>(
        builder: (BuildContext context, Products value, Widget? child){
          final productsData = Provider.of<Products>(context);
          final listOfProducts = productsData.getItems;

          return GridView.builder(
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
          );
        },
      ),
    );
  }
}
