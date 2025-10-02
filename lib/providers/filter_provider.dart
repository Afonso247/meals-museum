import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends Notifier<Map<Filter, bool>> {
  FiltersNotifier() : super();

  void setAllFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }
  
  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  @override
  Map<Filter, bool> build() {
    return {
      Filter.glutenFree: false,
      Filter.lactoseFree: false,
      Filter.vegetarian: false,
      Filter.vegan: false,
    };
  }
}

final filtersProvider = NotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  () => FiltersNotifier(),
);
