import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/dummy_food.dart';
import '../widgets/food_card.dart';
import '../models/cart_model.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Theme.of(context).brightness == Brightness.dark
                  ? 'lib/images/bg_dark.png'
                  : 'lib/images/bg_light.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: foodList.length,
          itemBuilder: (context, index) {
            final food = foodList[index];

            return Consumer<CartModel>(
              builder: (context, cart, _) {
                return FoodCard(
                  food: food,
                  trailing: IconButton(
                    icon: Icon(
                      cart.contains(food)
                          ? Icons.check_circle
                          : Icons.add_circle_outline,
                      color: Colors.orange,
                    ),
                    onPressed: () => cart.add(food),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}