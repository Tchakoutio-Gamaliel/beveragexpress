import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/product.dart';

class Apiservice {
  static const String baseUrl = 'http://172.24.126.184/beverage-api';

  static Future <List<Category>> getCategories() async {
    final response = await http.get(
      Uri.parse('$baseUrl/get_categories.php'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

      return data.map((json) => Category.fromjson(json)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
  }

  static Future <List<Product>> getPopullarProduts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/popular_products.php'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((json) => Product.fromjson(json)).toList();
    } else {
      throw Exception('Failed to load popular products');
    }
  }
}