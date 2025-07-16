import 'package:flutter/material.dart';
import 'package:grocery_mart/models/cart_item.dart';
import 'package:grocery_mart/models/product.dart';

class CartProvider with ChangeNotifier{
  final List <CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;


  // add product into carts in product add button in home 
  void addToCart(Product product) {
    // Check if the product is already in the cart
    final existingCartItem = _cartItems.firstWhere(
      (item) => item.productId == product.id,
      orElse: () => CartItem(
        id: '',
        productId: product.id,
        name: product.name,
        price: product.price,
        image: product.image,
        quantity: 0,
      ),
    );

    if (existingCartItem.quantity > 0) {
      // If it exists, increase the quantity
      existingCartItem.quantity++;
    } else {
      // If it doesn't exist, add a new CartItem
      _cartItems.add(CartItem(
        id: DateTime.now().toString(),
        productId: product.id,
        name: product.name,
        price: product.price,
        image: product.image,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  // update product quantity in cart
  void updateQuantity(String productId, int newQuantity) {
    final index = _cartItems.indexWhere((item) => item.productId == productId);
    if (index != -1 && newQuantity > 0) {
      _cartItems[index].quantity = newQuantity;
      notifyListeners();
    }

  // Remove product from cart
  }
  void removeFromCart(String productId) {
    _cartItems.removeWhere((item) => item.productId == productId);
    notifyListeners();
  }
}