import 'cartService.dart';
import 'package:flutter/foundation.dart';

ValueNotifier<int> cartCount = ValueNotifier<int>(0);

Future<void> loadCartCount() async {
  final items = cartservice.items;
  cartCount.value = items.length;
}