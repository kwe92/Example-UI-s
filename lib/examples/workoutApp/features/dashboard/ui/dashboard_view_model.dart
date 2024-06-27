import 'package:flutter/material.dart';

class DashboardViewModel extends ChangeNotifier {
  int _selectedCategory = 0;

  final _categories = ["All", "Warm Up", "Yoga", "Biceps", "Chest", "Legs"];

  int get selectedCategory => _selectedCategory;

  List<String> get categories => _categories;

  void setSelectedCategory(int index) {
    _selectedCategory = index;

    debugPrint("$_selectedCategory");

    notifyListeners();
  }
}
