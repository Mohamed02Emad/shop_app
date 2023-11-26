import 'package:flutter/material.dart';
import 'package:shop_app/screens/productDetail/ProductDetailScreen.dart';

import '../data/models/Product.dart';

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (widget.product.isFavorite) {
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
          navigateToProductDetail();
        },
        child: GridTile(
          footer: GridTileBar(
            leading: IconButton(
              icon: Icon(icon),
              onPressed: () {
                setState(() {
                  widget.product.isFavorite = !widget.product.isFavorite;
                });
              },
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            title: Text(
              widget.product.title,
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
                image: NetworkImage(widget.product.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigateToProductDetail() {
    Navigator.of(context).pushNamed(
      ProductDetailScreen.routeName, arguments: widget.product,
    );
  }
}
