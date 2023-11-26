import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data/providers/Products.dart';
import 'package:shop_app/widgets/ProductItem.dart';

class ProductsList extends StatelessWidget {
  final bool showOnlyFavourites;
  const ProductsList({required this.showOnlyFavourites,super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(builder: (_, val, __) {
      final products = showOnlyFavourites ? val.getFavouriteItems : val.getItems;
      return GridView.builder(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 240,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: const ProductItem(
            // productId: products[i].id,
          ),
        ),
      );
    });
  }
}
