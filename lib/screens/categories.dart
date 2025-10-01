import 'package:flutter/material.dart';

import 'package:meal_museum/widgets/category_grid_item.dart';
import 'package:meal_museum/data/dummy_data.dart';
import 'package:meal_museum/screens/meals.dart';
import 'package:meal_museum/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(titulo: category.title, meals: filteredMeals),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 colunas
          childAspectRatio: 3 / 2, // proporção largura/altura de cada item
          crossAxisSpacing: 16, // espaçamento horizontal entre itens
          mainAxisSpacing: 16, // espaçamento vertical entre itens
        ),
        children: [
          // grid de 2 colunas
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () => _selectCategory(context, category),
            ),
        ],
      ),
    );
  }
}
