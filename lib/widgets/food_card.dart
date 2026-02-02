import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard({super.key, required this.food, required IconButton trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(food.image, width: 50),
        title: Text(food.name),
        subtitle: Text(food.price),
        trailing: const Icon(Icons.add),
      ),
    );
  }
}