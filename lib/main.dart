import 'package:flutter/material.dart';
import 'package:grocery_mart/Screen/cart_screen.dart';
import 'package:grocery_mart/Screen/categories_screen.dart';
import 'package:grocery_mart/Screen/home.dart';
import 'package:grocery_mart/Screen/splash_screen.dart';
import 'package:grocery_mart/providers/cart_provider.dart';
import 'package:grocery_mart/providers/product_provider.dart';
import 'package:provider/provider.dart';

import 'providers/category_provider.dart';

void main() {
  runApp(
    // multiprovider is used to provide the ProductProvider to the widget tree
    MultiProvider(
      providers: [
        // providers for managing state
        ChangeNotifierProvider(create: (_) => ProductProvider()..loadProducts()), // Load products when the app starts
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()..loadCategories()), // Load categories when the app starts
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
          '/home': (context) => const Home(),
          '/bottom_navigation': (context) => const MainScreen(),
      },
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Home(),
    const CartScreen(),
    const CategoriesScreen(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
        ],
      ),
    );
  }
}