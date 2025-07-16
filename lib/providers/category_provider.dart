import 'package:flutter/material.dart';

import '../data/sample_category.dart';
import '../models/category.dart';

class CategoryProvider with ChangeNotifier{
  List<Category> _categories = SampleCategory.getCategories();

  List<Category> get categories => _categories;


  // load categories
  void loadCategories(){
    _categories = SampleCategory.getCategories();
    notifyListeners();
  }
}