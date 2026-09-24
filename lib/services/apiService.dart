import 'dart:convert';
import 'package:beverage_express/models/productinfo.dart';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/product.dart';

class Apiservice {
  static const String baseUrl = 'http://10.124.76.100/beverage-api'; 

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

  static Future <List<Product>> getProductsByCategory({
    required String categoryname,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/getProductsByCategory.php'),
      headers: {'ContentType': 'application/json'},
      body: jsonEncode({
        "categoryname": categoryname,
      })
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((json) => Product.fromjson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future <Productinfo> getProductInfo({
    required int productid,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/getProductsInfo.php'),
      headers: {'ContentType': 'application/json'},
      body: jsonEncode(
        {
          "productid": productid,
        })
    );
    if (response.statusCode == 200) {
      final  data = jsonDecode(response.body);

      return  Productinfo.fromjson(data);
    } else {
      throw Exception("Failed to load products");
    }
  }

  static Future <List<Product>> searchProducts({
  required String search,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl/search_products.php?search=$search')
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((json) => Product.fromjson(json)).toList();
    } else {
      throw Exception('Fail to load products');
    }
  }
}