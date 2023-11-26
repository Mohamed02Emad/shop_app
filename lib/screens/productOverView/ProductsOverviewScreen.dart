import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data/providers/Products.dart';
import 'package:shop_app/widgets/products_list_widget.dart';



class ProductsOverViewScreen extends StatefulWidget {
  const ProductsOverViewScreen({super.key});

  @override
  State<ProductsOverViewScreen> createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  @override
  Widget build(BuildContext context) {
    final loadedProducts = Provider.of<Products>(context).getItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store"),
        centerTitle: true,
      ),
      body: Consumer<Products>(
        builder:(_,ctx,__)=>  ProductsList(listOfProducts: loadedProducts),
      )
    );
  }
}
