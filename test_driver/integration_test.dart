import 'package:integration_test/integration_test_driver.dart';

// TODO: add bash script to run test for you

/// https://github.com/flutter/flutter/tree/main/packages/integration_test#using-flutter-driver-to-run-tests

/*

flutter drive \
    --driver=test_driver/integration_test.dart \
    --target=integration_test/sign_in_test.dart
    
*/

Future<void> main() => integrationDriver();
