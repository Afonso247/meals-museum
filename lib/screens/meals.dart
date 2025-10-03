import 'package:flutter/material.dart';

import 'package:meal_museum/models/meal.dart';
import 'package:meal_museum/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.titulo,
    required this.meals,
  });

  final String? titulo;
  final List<Meal> meals;

  @override
  Widget build(context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return MealItem(
          meal: meals[index],
        );
      },
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Nenhuma refeição encontrada',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            // ElevatedButton.icon(
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            //   icon: const Icon(Icons.arrow_back),
            //   label: const Text('Voltar'),
            // ),
          ],
        ),
      );
    }

    if (titulo == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(titulo!)),
      body: content,
    );
  }
}
