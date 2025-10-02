import 'package:flutter/material.dart';
import 'package:meal_museum/models/meal.dart';
import 'package:meal_museum/widgets/meal_details_item.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  // bool _isFavorite = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _isFavorite = widget.isFavorite;
  // }
  // void _toggleFavorite() {
  //   setState(() {
  //     _isFavorite = !_isFavorite;
  //   });
  //   widget.onToggleFavorite(widget.meal);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            // icon: Icon(
            //   _isFavorite ? Icons.favorite : Icons.favorite_border,
            // ),
            icon: Icon(Icons.favorite),
            onPressed: () => widget.onToggleFavorite(widget.meal),
          ),
        ],
      ),
      body: Center(child: MealDetailsItem(meal: widget.meal)),
    );
  }
}
