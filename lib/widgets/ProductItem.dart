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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Added to cart',
                          textAlign: TextAlign.center,
                        ),
                        duration: const Duration(
                          milliseconds: 2000,
                        ),
                        action: SnackBarAction(
                          label: "UNDO",
                          onPressed: () {
                            cart.removeItem(product.id);
                          },
                        ),
                      ),
                    );
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
          child: Stack(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage(
                    placeholder:
                        const AssetImage("assets/images/placeholder.jpeg"),
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      navigateToProductDetail(product.id, context);
                    },
                    splashColor: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
            ],
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
