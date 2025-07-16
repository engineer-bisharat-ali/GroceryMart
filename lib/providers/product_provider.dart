import 'package:flutter/material.dart';

import '../data/sample_products.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void loadProducts() {
    _products = SampleProducts.getproduct();

    notifyListeners();
  }


}
