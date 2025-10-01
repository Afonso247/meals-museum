import 'package:flutter/material.dart';

import 'package:meal_museum/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
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
            _buildCategoryItem(category.title, category.color),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.7),
            color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}