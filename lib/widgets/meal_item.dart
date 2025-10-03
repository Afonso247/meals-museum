import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:meal_museum/models/meal.dart';
import 'package:meal_museum/screens/meal_details.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    super.key,
    required this.meal,
  });

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Baixo';
      case Complexity.challenging:
        return 'Médio';
      case Complexity.hard:
        return 'Alto';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Barato';
      case Affordability.pricey:
        return 'Médio';
      case Affordability.luxurious:
        return 'Caro';
    }
  }

  IconData get complexityIcon {
    switch (meal.complexity) {
      case Complexity.simple:
        return Icons.star_border;
      case Complexity.challenging:
        return Icons.star;
      case Complexity.hard:
        return Icons.workspace_premium;
    }
  }

  IconData get affordabilityIcon {
    switch (meal.affordability) {
      case Affordability.affordable:
        return Icons.monetization_on;
      case Affordability.pricey:
        return Icons.attach_money;
      case Affordability.luxurious:
        return Icons.diamond;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => MealDetailsScreen(
              meal: meal,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Hero(
                    tag: meal.id,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 300),
                      fadeOutDuration: const Duration(milliseconds: 100),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text(
                        '${meal.duration} min',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(complexityIcon),
                      const SizedBox(width: 6),
                      Text(
                        complexityText,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(affordabilityIcon),
                      const SizedBox(width: 6),
                      Text(
                        affordabilityText,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
