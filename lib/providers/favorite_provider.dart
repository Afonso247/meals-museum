import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_museum/models/meal.dart';

class FavoriteMealsNotifier extends Notifier<List<Meal>> {
  FavoriteMealsNotifier() : super();

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }

  @override
  List<Meal> build() {
    return [];
  }
}

final favoriteMealsProvider =
    NotifierProvider<FavoriteMealsNotifier, List<Meal>>(
      FavoriteMealsNotifier.new,
    );
