import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data/providers/Products.dart';
import 'package:shop_app/screens/addProductScreen/add_product_screen.dart';
import 'package:shop_app/widgets/your_product_item.dart';

class YourProductsScreen extends StatelessWidget {
  const YourProductsScreen({super.key});

  static const route = "/your_products_screen";

  @override
  Widget build(BuildContext context) {
    // List<Product> products = [];
    var products = Provider.of<Products>(context).getItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: IconButton(
              onPressed: () {
                navigateToAddNewProduct(context);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (ctx, index) => YourProductItem(
              product: products[index],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToAddNewProduct(BuildContext context) {
    Navigator.of(context).pushNamed(
      AddProductScreen.route
    );
  }
}
