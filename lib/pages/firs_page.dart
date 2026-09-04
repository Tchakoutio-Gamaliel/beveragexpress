import 'package:beverage_express/pages/cart_page.dart';
import 'package:beverage_express/pages/favorite_page.dart';
import 'package:beverage_express/pages/home.dart';
import 'package:beverage_express/pages/profile_page.dart';
import 'package:beverage_express/pages/search_page.dart';
import 'package:flutter/material.dart';

class FirstPages extends StatefulWidget {
  const FirstPages({super.key});

  @override
  State<FirstPages> createState() => _FirstPagesState();
}

class _FirstPagesState extends State<FirstPages> {
  int _selectedIndex = 0;

  final List _pages = [
  Home(),
  SearchPage(),
  CartPage(),
  FavoritePage(),
  ProfilePage(),
  ];

  void _changePages(int index) {
  setState(() {
    _selectedIndex = index;
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromARGB(255, 12, 4, 129),
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.white,
      currentIndex: _selectedIndex,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          ),
         BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorite',
         ),
           BottomNavigationBarItem(
          icon: Icon(Icons.person_2),
          label: 'Profile',
        ),
        ],
        onTap: _changePages,
        ),
    );
  }
}