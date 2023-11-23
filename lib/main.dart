import 'package:flutter/material.dart';
import 'package:shop_app/screens/productOverView/ProductsOverviewScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color.fromARGB(255, 243, 243, 243),
        useMaterial3: true,
      ),
      home:  ProductsOverViewScreen(),
      routes:  {

      },
    );
  }
}

