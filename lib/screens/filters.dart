import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:meal_museum/widgets/main_drawer.dart';
// import 'package:meal_museum/screens/tabs.dart';
import 'package:meal_museum/providers/filter_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    super.initState();
    final currentFilters = ref.read(filtersProvider);
    _glutenFree = currentFilters[Filter.glutenFree]!;
    _lactoseFree = currentFilters[Filter.lactoseFree]!;
    _vegan = currentFilters[Filter.vegan]!;
    _vegetarian = currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        ref.read(filtersProvider.notifier).setAllFilters({
          Filter.glutenFree: _glutenFree,
          Filter.lactoseFree: _lactoseFree,
          Filter.vegetarian: _vegetarian,
          Filter.vegan: _vegan,
        });
        Navigator.of(context).pop();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Filtros')),
        // drawer: MainDrawer(onSelectScreen: (identifier) {
        //   Navigator.of(context).pop();
        //   if (identifier == 'meals') {
        //     Navigator.of(context).pushReplacement(
        //       MaterialPageRoute(builder: (ctx) => const TabsScreen()),
        //     ); // Home
        //   }
        // }),
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
              value: _glutenFree,
              onChanged: (value) => setState(() => _glutenFree = value),
            ),
            SwitchListTile(
              title: Text('Sem Lactose'),
              subtitle: Text('Só exibe refeicoes sem lactose.'),
              value: _lactoseFree,
              onChanged: (value) => setState(() => _lactoseFree = value),
            ),
            SwitchListTile(
              title: Text('Vegetariano'),
              subtitle: Text('Só exibe refeicoes vegetarianas.'),
              value: _vegetarian,
              onChanged: (value) => setState(() => _vegetarian = value),
            ),
            SwitchListTile(
              title: Text('Vegano'),
              subtitle: Text('Só exibe refeicoes veganas.'),
              value: _vegan,
              onChanged: (value) => setState(() => _vegan = value),
            ),
          ],
        ),
      ),
    );
  }
}
