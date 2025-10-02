import 'package:flutter/material.dart';

import 'package:meal_museum/models/meal.dart';
import 'package:meal_museum/widgets/meal_details_item.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Center(
        child: MealDetailsItem(meal: meal),
      ),
    );
  }
}