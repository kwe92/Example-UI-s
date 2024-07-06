import 'package:example_ui/features/dashboard/ui/dashboard_view.dart';
import 'package:flutter/material.dart';

class NavigatorViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  final List<Widget> _currentChild = [
    const DashboardView(),
    const DashboardView(),
    const DashboardView(),
    const DashboardView(),
  ];

  List<Widget> get currentChild => _currentChild;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
