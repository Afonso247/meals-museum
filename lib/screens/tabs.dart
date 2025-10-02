import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_museum/screens/categories.dart';
import 'package:meal_museum/screens/meals.dart';
import 'package:meal_museum/widgets/main_drawer.dart';
import 'package:meal_museum/screens/filters.dart';
import 'package:meal_museum/providers/meal_provider.dart';
import 'package:meal_museum/providers/favorite_provider.dart';
import 'package:meal_museum/providers/filter_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop(); // Fechar o drawer
    if (identifier == 'filters') {
      // Navegar até filters
      await Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => FiltersScreen()));
    } else {
      // Navegar até meals (home)
      setState(() {
        _selectedPageIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final setMeals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filtersProvider);
    final availableMeals = setMeals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(availableMeals: availableMeals);
    String activePageTitle = 'Categorias';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(meals: favoriteMeals);
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
