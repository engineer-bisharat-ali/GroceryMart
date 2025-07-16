import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item.dart';

class SharedPrefsHelper {
  static const _cartKey = 'cart';

  // Save cart to SharedPreferences
  static Future<void> saveCart(List<CartItem> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> cartJsonList =
        cartItems.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList(_cartKey, cartJsonList);
  }

  // Load cart from SharedPreferences
  static Future<List<CartItem>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> cartJsonList = prefs.getStringList(_cartKey) ?? [];

    return cartJsonList
        .map((item) => CartItem.fromJson(jsonDecode(item)))
        .toList();
  }

  // Clear saved cart (optional helper)
  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }
}
