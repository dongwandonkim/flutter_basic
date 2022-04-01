import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  List<String>? pageTitle;
  List<Widget>? pages;

  void _selectedPage(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

  @override
  void initState() {
    pageTitle = ['Categories', 'Favorites'];

    pages = [
      const CategoriesScreen(),
      FavoritesScreen(favoriteMeals: widget.favoriteMeals),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle![_selectedIndex]),
      ),
      drawer: const MainDrawer(),
      body: pages![_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Favorites'),
        ],
      ),
    );
  }
}
