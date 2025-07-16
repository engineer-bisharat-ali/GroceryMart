import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  // List to hold cart items
  final List<CartItem> _cartItems = [];

  // Public getter for UI to access cart items
  List<CartItem> get cartItems => _cartItems;

  // Constructor: Load saved cart on app startup
  CartProvider() {
    loadCartFromPrefs();
  }

  // ----------------------------
  // Add product to cart
  // ----------------------------
  void addToCart(Product product) {
    // Check if product already exists in cart
    final existingCartItem = _cartItems.firstWhere(
      (item) => item.productId == product.id,
      orElse: () => CartItem(
        id: '', // placeholder, will be ignored
        productId: product.id,
        name: product.name,
        price: product.price,
        image: product.image,
        quantity: 0,
      ),
    );

    if (existingCartItem.quantity > 0) {
      // If exists, just increase quantity
      existingCartItem.quantity++;
    } else {
      // Else add a new cart item
      _cartItems.add(CartItem(
        id: DateTime.now().toString(),
        productId: product.id,
        name: product.name,
        price: product.price,
        image: product.image,
        quantity: 1,
      ));
    }

    // Save updated cart to SharedPreferences
    saveCartToPrefs();
    notifyListeners();
  }

  // ----------------------------
  // Update product quantity
  // ----------------------------
  void updateQuantity(String productId, int newQuantity) {
    final index = _cartItems.indexWhere((item) => item.productId == productId);
    if (index != -1 && newQuantity > 0) {
      _cartItems[index].quantity = newQuantity;
      saveCartToPrefs();
      notifyListeners();
    }
  }

  // ----------------------------
  // Remove product from cart
  // ----------------------------
  void removeFromCart(String productId) {
    _cartItems.removeWhere((item) => item.productId == productId);
    saveCartToPrefs();
    notifyListeners();
  }

  // ----------------------------
  // Clear full cart (optional)
  // ----------------------------
  Future<void> clearCart() async {
    _cartItems.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart');
    notifyListeners();
  }

  // ----------------------------
  // Save cart to SharedPreferences
  // ----------------------------
  Future<void> saveCartToPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    // Convert each CartItem to JSON string
    final List<String> cartJsonList =
        _cartItems.map((item) => jsonEncode(item.toJson())).toList();

    // Save list to SharedPreferences
    await prefs.setStringList('cart', cartJsonList);
  }

  // ----------------------------
  // Load cart from SharedPreferences
  // ----------------------------
  Future<void> loadCartFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    // Get saved cart data
    final List<String> cartJsonList = prefs.getStringList('cart') ?? [];

    _cartItems.clear();

    // Decode and convert back to CartItem objects
    _cartItems.addAll(
      cartJsonList
          .map((itemJson) => CartItem.fromJson(jsonDecode(itemJson)))
          .toList(),
    );

    notifyListeners();
  }
}
