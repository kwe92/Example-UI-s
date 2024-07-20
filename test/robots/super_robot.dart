// ignore_for_file: unused_field

//   - ignored because linter says  _tester is unused when it is used for initializer list

import 'package:flutter_test/flutter_test.dart';

import 'auth_robot.dart';
import 'dashboard_robot.dart';

class SuperRobot {
  final AuthRobot authRobot;

  final DashboardRobot dashboardRobot;

  final WidgetTester _tester;

  SuperRobot(this._tester)
      : authRobot = AuthRobot(_tester),
        dashboardRobot = DashboardRobot(_tester);
}
