import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexThemeData.light(
          scheme: FlexScheme.mandyRed,
          tabBarStyle: FlexTabBarStyle.forBackground),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
      },

      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (ctx) => const CategoriesScreen(),
      ),
    );
  }
}
