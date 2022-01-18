import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/screens/cart_screen.dart';
import 'package:full_ecommerce_app/screens/feeds_screen.dart';
import 'package:full_ecommerce_app/screens/home_screen.dart';
import 'package:full_ecommerce_app/screens/search_screen.dart';
import 'package:full_ecommerce_app/screens/user_screen.dart';

class BottomNavScreen extends StatefulWidget {
  static const routeName = '/bottom-nav-screen';
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _pages = [
    const HomeScreen(),
    FeedsScreen(),
    const SearchScreen(),
    const CartScreen(),
    const UserScreen(),
  ];

  int _currentIndex = 0;

  _onTap(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavBar = BottomNavigationBar(
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home', tooltip: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed), label: 'Feeds', tooltip: 'Feeds'),
          BottomNavigationBarItem(icon: Icon(null), label: '', tooltip: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Cart', tooltip: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'User', tooltip: 'User'),
        ]);

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: bottomNavBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onTap(2);
        },
        tooltip: 'Search',
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
