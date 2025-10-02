import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_museum/models/meal.dart';
import 'package:meal_museum/data/dummy_data.dart';

final mealsProvider = Provider<List<Meal>>((ref) {
  return dummyMeals;
});

