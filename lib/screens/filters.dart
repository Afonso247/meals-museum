import 'package:flutter/material.dart';

// import 'package:meal_museum/widgets/main_drawer.dart';
// import 'package:meal_museum/screens/tabs.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            subtitle: Text('Só exibe refeicoes sem gluten.'),
            value: _glutenFree,
            onChanged: (value) => setState(() => _glutenFree = value),
          ),
          SwitchListTile(
            title: Text('Sem Lactose'),
            subtitle: Text('Só exibe refeicoes sem lactose.'),
            value: _lactoseFree,
            onChanged: (value) => setState(() => _lactoseFree = value),
          ),
          SwitchListTile(
            title: Text('Vegetariano'),
            subtitle: Text('Só exibe refeicoes vegetarianas.'),
            value: _vegetarian,
            onChanged: (value) => setState(() => _vegetarian = value),
          ),
          SwitchListTile(
            title: Text('Vegano'),
            subtitle: Text('Só exibe refeicoes veganas.'),
            value: _vegan,
            onChanged: (value) => setState(() => _vegan = value),
          ),
        ],
      ),
    );
  }
}
