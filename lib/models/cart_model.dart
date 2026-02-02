import 'package:flutter/material.dart';
import '../models/food.dart';

class CartModel extends ChangeNotifier {
  final List<Food> _items = [];

  List<Food> get items => _items;

  void add(Food food) {
    _items.add(food);
    notifyListeners();
  }

  void remove(Food food) {
    _items.remove(food);
    notifyListeners();
  }

  bool contains(Food food) {
    return _items.contains(food);
  }
}