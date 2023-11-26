import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/productDetail/ProductDetailScreen.dart';
import 'package:shop_app/screens/productOverView/ProductsOverviewScreen.dart';

import './data/providers/Products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: const Color.fromARGB(255, 243, 243, 243),
          useMaterial3: true,
        ),
        home: const ProductsOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen()
        },
      ),
    );
  }
}
