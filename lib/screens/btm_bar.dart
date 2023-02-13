import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:seller_app/provider/dark_theme_provider.dart';
import 'package:seller_app/screens/cart.dart';
import 'package:seller_app/screens/categories.dart';
import 'package:seller_app/screens/home_screen.dart';
import 'package:seller_app/screens/user.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Map<String, dynamic>> _pages = [
    {"page" : HomeScreen(), "title": "Home Screen"},
    {"page" : CategoriesScreen(), "title": "Categories Screen"},
    {"page" : CartScreen(), "title": "Cart Screen"},
    {"page" : UserScreen(), "title": "User Screen"},
  ];

  int _selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;

    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber, //themeState.getDarkTheme ? Theme.of(context).cardColor : Colors.black,
        showSelectedLabels: false,
        currentIndex: _selectedIndex,
        selectedItemColor: _isDark ? Colors.white : Colors.lightBlue,
        unselectedItemColor: _isDark ? Colors.white : Colors.black,
        onTap: (value) => _selectedPage(value),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:  _selectedIndex == 0 ? Icon(IconlyBold.home) : Icon(IconlyLight.home), label: "Main"),
          BottomNavigationBarItem(icon: _selectedIndex == 1 ? Icon(IconlyBold.category) : Icon(IconlyLight.category), label: "Categories"),
          BottomNavigationBarItem(icon: _selectedIndex == 2 ? Icon(IconlyBold.buy) : Icon(IconlyLight.buy), label: "Cart"),
          BottomNavigationBarItem(icon: _selectedIndex == 3 ? Icon(IconlyBold.user2) : Icon(IconlyLight.user2), label: "User"),
        ],

      ),
    );
  }
}
