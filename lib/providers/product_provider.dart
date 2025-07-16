import 'package:flutter/material.dart';

import '../data/sample_products.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _featuredProducts = [];

  List<Product> get products => _products;
  List<Product> get featuredProducts => _featuredProducts;

  void loadProducts() {
    _products = SampleProducts.getproduct();
    _featuredProducts = SampleProducts.getFeaturedProducts();

    notifyListeners();
  }


}
