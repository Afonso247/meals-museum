import 'package:flutter/material.dart';

import 'package:meal_museum/models/meal.dart';
import 'package:meal_museum/screens/categories.dart';
import 'package:meal_museum/screens/meals.dart';
import 'package:meal_museum/widgets/main_drawer.dart';
import 'package:meal_museum/screens/filters.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleFavoriteStatus(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
      _showInfoMessage(
        _favoriteMeals.contains(meal)
            ? 'Adicionado aos favoritos'
            : 'Removido dos favoritos',
      );
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop(); // Fechar o drawer
    if (identifier == 'filters') {
      // Navegar até filters
      final result = await Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => FiltersScreen()));

      if (result != null) {
        debugPrint('Filtros aplicados:');
        debugPrint('Sem Gluten: ${result[Filter.glutenFree]}');
        debugPrint('Sem Lactose: ${result[Filter.lactoseFree]}');
        debugPrint('Vegetariano: ${result[Filter.vegetarian]}');
        debugPrint('Vegano: ${result[Filter.vegan]}');
      }
    } else {
      // Navegar até meals (home)
      setState(() {
        _selectedPageIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleFavoriteStatus,
    );
    String activePageTitle = 'Categorias';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleFavoriteStatus,
      );
      activePageTitle = 'Favoritas';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _selectPage(index),
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritas',
          ),
        ],
      ),
    );
  }
}
