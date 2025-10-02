import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:meal_museum/widgets/main_drawer.dart';
// import 'package:meal_museum/screens/tabs.dart';
import 'package:meal_museum/providers/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Filtros')),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(
              'Sem Gluten',
              // style: Theme.of(context).textTheme.titleLarge!.copyWith(
              //   color: Theme.of(context).colorScheme.onSurface,
              // ),
            ),
            subtitle: Text('Só exibe refeicoes sem gluten.'),
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (value) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenFree, value),
          ),
          SwitchListTile(
            title: Text('Sem Lactose'),
            subtitle: Text('Só exibe refeicoes sem lactose.'),
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (value) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, value),
          ),
          SwitchListTile(
            title: Text('Vegetariano'),
            subtitle: Text('Só exibe refeicoes vegetarianas.'),
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (value) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegetarian, value),
          ),
          SwitchListTile(
            title: Text('Vegano'),
            subtitle: Text('Só exibe refeicoes veganas.'),
            value: activeFilters[Filter.vegan]!,
            onChanged: (value) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegan, value),
          ),
        ],
      ),
    );
  }
}
