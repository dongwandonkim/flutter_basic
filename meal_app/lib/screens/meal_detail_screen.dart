import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static String routeName = '/meal-detail';
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId\'s id'),
      ),
      body: const Center(
        child: Text('meal detail'),
      ),
    );
  }
}
