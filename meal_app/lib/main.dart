import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: FlexColorScheme.light(scheme: FlexScheme.aquaBlue).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.aquaBlue).toTheme,

      // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FilterScreen.routeName: (ctx) => const FilterScreen(),
      },

      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (ctx) => const CategoriesScreen(),
      ),
    );
  }
}
