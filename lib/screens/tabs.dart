import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_museum/screens/categories.dart';
import 'package:meal_museum/screens/meals.dart';
import 'package:meal_museum/widgets/main_drawer.dart';
import 'package:meal_museum/screens/filters.dart';
import 'package:meal_museum/providers/meal_provider.dart';
import 'package:meal_museum/providers/favorite_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  Map<Filter, bool> _filters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop(); // Fechar o drawer
    if (identifier == 'filters') {
      // Navegar até filters
      final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentFilters: _filters),
        ),
      );

      if (result != null) {
        setState(() {
          _filters = result;
        });
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
    final setMeals = ref.watch(mealsProvider);
    final availableMeals = setMeals.where((meal) {
      if (_filters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_filters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_filters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    String activePageTitle = 'Categorias';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
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
