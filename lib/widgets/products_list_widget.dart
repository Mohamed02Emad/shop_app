import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  var _isLoading = false;
  late Products productsProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstOpen) {
      productsProvider = Provider.of<Products>(context);
      _isFirstOpen = false;
      loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(builder: (_, val, __) {
      final products =
          widget.showOnlyFavourites ? val.getFavouriteItems : val.getItems;
      return _isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.blue,
            ))
          : RefreshIndicator(
              onRefresh: () async{
                productsProvider.clearAll();
                await loadData();
              },
              child: GridView.builder(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 20, bottom: 20),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 240,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: products.length,
                itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  value: products[i],
                  child: const ProductItem(),
                ),
              ),
            );
    });
  }

  Future<void> loadData() {
    setState(() {
      _isLoading = true;
    });
    return NetworkHelper.getProducts("products").then((response) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sucess"),
        duration: Duration(seconds: 1),
      ));
      setState(() {
        _isLoading = false;
      });
      productsProvider.addAllFromJson(response!.body);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error"),
        duration: Duration(seconds: 1),
      ));
      setState(() {
        _isLoading = false;
      });
    });
  }
}
