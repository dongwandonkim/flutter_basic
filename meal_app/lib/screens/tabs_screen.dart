import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  List<String> pageTitle = ['Categories', 'Favorites'];

  void _selectedPage(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _selectedIndex,
      length: pageTitle.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(pageTitle[_selectedIndex]),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
        bottomNavigationBar: SizedBox(
          child: TabBar(
            onTap: _selectedPage,
            tabs: const [
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favorites",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
