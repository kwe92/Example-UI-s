import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void setTestDeviceSize(WidgetTester tester, [Size size = const Size(1170, 2532)]) {
  tester.view.physicalSize = size;
}
