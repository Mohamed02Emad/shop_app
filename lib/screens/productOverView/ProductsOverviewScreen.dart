import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data/providers/cart_provider.dart';
import 'package:shop_app/screens/cart_screen/cart_screen.dart';
import 'package:shop_app/screens/orders_screen/orders_screen.dart';
import 'package:shop_app/widgets/products_list_widget.dart';



class ProductsOverViewScreen extends StatefulWidget {
  const ProductsOverViewScreen({super.key});

  @override
  State<ProductsOverViewScreen> createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {

  var showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              navigateToOrders();
            },
            icon: const Icon(Icons.calendar_month_sharp),
          ),
          IconButton(
            onPressed: () {
              navigateToCart();
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          PopupMenuButton(
            onSelected: (int val) {
              var showFavourite = val == 0;
              if (showFavourite) {
                setState(() {
                  showOnlyFavourites = true;
                });
              } else {
                setState(() {
                  showOnlyFavourites = false;
                });
              }
            },
            icon: const Icon(
              Icons.menu,
            ),
            itemBuilder: (_) =>
            [
              const PopupMenuItem(
                value: 0,
                child: Text("Favorite"),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text("All"),
              ),
            ],
          ),
        ],
      ),
      body: ProductsList(showOnlyFavourites: showOnlyFavourites),
    );
  }

  void navigateToCart() {
    Navigator.of(context).pushNamed(
      CartScreen.route,
    );
  }
  void navigateToOrders() {
    Navigator.of(context).pushNamed(
      OrdersScreen.route,
    );
  }
}
