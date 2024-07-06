import 'package:flutter/material.dart';

class WidgetKey {
  WidgetKey._();
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
