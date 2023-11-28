import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data/models/Product.dart';
import 'package:shop_app/data/providers/Products.dart';
import 'package:shop_app/utils/networkHelper.dart';
import 'package:shop_app/widgets/ProductItem.dart';

class ProductsList extends StatefulWidget {
  final bool showOnlyFavourites;

  const ProductsList({required this.showOnlyFavourites, super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  var _isFirstOpen = true;
  late Products productsProvider;

  @override
  void didChangeDependencies() {
    if (_isFirstOpen) {
      _isFirstOpen = false;
      productsProvider = Provider.of<Products>(context);
      var response = NetworkHelper.getProducts("products").then(
        (response) {
         productsProvider.addAllFromJson(response!.body);
        },
      );
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(builder: (_, val, __) {
      final products =
          widget.showOnlyFavourites ? val.getFavouriteItems : val.getItems;
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
