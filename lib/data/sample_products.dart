import 'package:grocery_mart/models/product.dart';

class SampleProducts{
  static List<Product> getproduct(){
     return [
      // Fruits
      Product(
        id: '1',
        name: 'Fresh Apples',
        price: 2.99,
        image: 'assets/images/pepper.png',
        category: 'Fruits',
        description: 'Fresh and crispy red apples',
      ),
      Product(
        id: '2',
        name: 'Bananas',
        price: 1.99,
        image: 'assets/images/banana.png',
        category: 'Fruits',
        description: 'Ripe yellow bananas',
      ),
      Product(
        id: '3',
        name: 'Orange',
        price: 3.49,
        image: 'assets/images/banana.png',
        category: 'Fruits',
        description: 'Juicy oranges packed with vitamin C',
      ),
      Product(
        id: '4',
        name: 'Grapes',
        price: 4.99,
        image: 'assets/images/pepper.png',
        category: 'Fruits',
        description: 'Sweet purple grapes',
      ),
      Product(
        id: '5',
        name: 'Strawberries',
        price: 5.99,
        image: 'assets/images/pepper.png',
        category: 'Fruits',
        description: 'Fresh strawberries',
      ),

      // Vegetables
      Product(
        id: '6',
        name: 'Carrots',
        price: 1.49,
        image: 'assets/images/banana.png',
        category: 'Vegetables',
        description: 'Fresh orange carrots',
      ),
      Product(
        id: '7',
        name: 'Broccoli',
        price: 2.99,
        image: 'assets/images/banana.png',
        category: 'Vegetables',
        description: 'Fresh green broccoli',
      ),
      Product(
        id: '8',
        name: 'Tomatoes',
        price: 3.99,
        image: 'assets/images/pepper.png',
        category: 'Vegetables',
        description: 'Fresh red tomatoes',
      ),
      Product(
        id: '9',
        name: 'Bell Peppers',
        price: 2.49,
        image: 'assets/images/pepper.png',
        category: 'Vegetables',
        description: 'Colorful bell peppers',
      ),
      Product(
        id: '10',
        name: 'Lettuce',
        price: 1.99,
        image: 'assets/images/banana.png',
        category: 'Vegetables',
        description: 'Fresh green lettuce',
      ),

      // Dairy
      Product(
        id: '11',
        name: 'Milk',
        price: 3.99,
        image: 'assets/images/banana.png',
        category: 'Dairy',
        description: 'Fresh whole milk',
      ),
      Product(
        id: '12',
        name: 'Cheese',
        price: 5.99,
        image: 'assets/images/pepper.png',
        category: 'Dairy',
        description: 'Premium cheddar cheese',
      ),
      Product(
        id: '13',
        name: 'Yogurt',
        price: 4.49,
        image: 'assets/images/banana.png',
        category: 'Dairy',
        description: 'Creamy Greek yogurt',
      ),

      // Bakery
      Product(
        id: '14',
        name: 'Bread',
        price: 2.99,
        image: 'assets/images/pepper.png',
        category: 'Bakery',
        description: 'Fresh whole wheat bread',
      ),
      Product(
        id: '15',
        name: 'Croissants',
        price: 4.99,
        image: 'assets/images/banana.png',
        category: 'Bakery',
        description: 'Buttery French croissants',
      ),
    ];
  }

    // get featured products
    static List<Product> getFeaturedProducts() {
      final products = getproduct();
      return [
      products[0], // Apples
      products[1], // Bananas
      products[5], // Carrots
      products[10], // Milk
      products[13], // Bread
      ];
    }
}