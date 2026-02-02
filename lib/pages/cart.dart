import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
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
        child: Consumer<CartModel>(
          builder: (context, cart, _) {
            if (cart.items.isEmpty) {
              return const Center(
                child: Text('Your cart is empty 🛒', style: TextStyle(fontSize: 18)),
              );
            }

            return ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    leading: Image.asset(item.image, width: 50),
                    title: Text(item.name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => cart.remove(item),
                    ),
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