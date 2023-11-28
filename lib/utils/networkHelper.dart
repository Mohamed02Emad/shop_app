import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/data/models/Product.dart';

class NetworkHelper{
  static const BASE_URL = "https://flutter-shop-app-202ad-default-rtdb.firebaseio.com/";

  static Future<http.Response?> postProduct(String endpoint, Product product, {String baseUrl = BASE_URL}) async {
    final uri = Uri.parse("$baseUrl$endpoint.json");
    try {
      final response = await http.post(
        uri,
        body: json.encode(product.toJson()),
      );
      return response;
    } catch (e) {
      print("postErrorMessage ${e.toString()}");
      return null;
    }
  }

  static Future<http.Response?> getProducts(String endpoint, {String baseUrl = BASE_URL}) async {
    final uri = Uri.parse("$baseUrl$endpoint.json");
    try {
      final response = await http.get(
        uri,
      );
      return response;
    } catch (e) {
      print("getErrorMessage ${e.toString()}");
      return null;
    }
  }
  static Future<http.Response?> deleteProducts(String endpoint,String productId , {String baseUrl = BASE_URL}) async {
    final uri = Uri.parse("$baseUrl$endpoint$productId.json");
    try {
      final response = await http.delete(
        uri,
      );
      return response;
    } catch (e) {
      print("deleteErrorMessage ${e.toString()}");
      return null;
    }
  }
}

