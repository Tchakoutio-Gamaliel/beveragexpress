import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Authservice {
  static const String baseUrl = 'http://10.124.76.100/beverage-api';

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try{
      final response = await http.post(
        Uri.parse('$baseUrl/auth.php?action=register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'number': phone,
          'password': password,
        }),
        );

        if (response.statusCode == 200) {
          final result = jsonDecode(response.body);
          if (result['success']) {
            await _saveToken(result['token']);
          }
          return result;
        }
        return {'success': false, 'message': 'server error'};
    } catch (e) {
      return {'success': false, 'message': 'connectio error: $e'};
    }
  }


  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth.php?action=login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
    
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (result['success']) {
          await _saveToken(result['token']);
        }
        return result;
      }
      return {'success': false, 'message': 'server error'};
    } catch(e) {
      return {'success': false, 'message': 'connection error: $e'};
    }
  }
  
  //here we are storing the token in the local phone storage
  static Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('customer_token', token);
  }

  //here we are geting the token from the local storage
  static Future<String?> _getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('customer_token');
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('customer_token');
    await prefs.remove('isLogin');
  }
}