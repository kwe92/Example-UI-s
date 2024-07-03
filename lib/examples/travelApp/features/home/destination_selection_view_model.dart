import 'package:example_ui/examples/travelApp/features/shared/model/destination.dart';
import 'package:example_ui/examples/travelApp/features/shared/services/destination_service.dart';
import 'package:flutter/material.dart';

class DestinationSelectionViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  bool _showBottomNav = false;

  bool get showBottomNav => _showBottomNav;

  List<Destination> get destinations => DestinationService().destinations;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setShowBottomNav(bool showNav) {
    _showBottomNav = showNav;
    notifyListeners();
  }

  Future<List<Destination>> getData() async => await DestinationService().fetchData();
}
