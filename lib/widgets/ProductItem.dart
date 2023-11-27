import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data/models/Product.dart';
import 'package:shop_app/data/providers/cart_provider.dart';
import 'package:shop_app/screens/productDetail/ProductDetailScreen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    // final cart = Provider.of<CartProvider>(context, listen: false);
    IconData icon;
    if (product.isFavorite) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_outline;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        splashColor: Colors.grey[600]?.withAlpha(80),
        onTap: () {
          navigateToProductDetail(product.id , context);
        },
        child: GridTile(
          footer: GridTileBar(
            leading: IconButton(
              icon: Icon(icon),
              onPressed: () {
                product.toggleFavorite();
              },
            ),
            trailing: Consumer<CartProvider>(
              builder: (__, cart,_) {
                return IconButton(
                  icon:  Icon(cart.isProductInCart(product.id) ? Icons.shopping_cart : Icons.shopping_cart_outlined),
                  onPressed: () {
                    cart.addItem(product.id, product.toCartItem());
                  },
                );
              },
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            backgroundColor: Colors.black.withAlpha(200),
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigateToProductDetail(String productId , BuildContext context) {
    Navigator.of(context).pushNamed(
      ProductDetailScreen.routeName,
      arguments: productId,
    );
  }

}
