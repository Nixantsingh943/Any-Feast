import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget{
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant),label: 'Recipes'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer),label: 'Offers'),

      ],
    );
  }
}