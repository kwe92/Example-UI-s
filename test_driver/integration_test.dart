import 'package:integration_test/integration_test_driver.dart';

/// https://github.com/flutter/flutter/tree/main/packages/integration_test#using-flutter-driver-to-run-tests

/*flutter drive \
    --driver=test_driver/integration_test.dart \
    --target=integration_test/foo_test.dart
*/

Future<void> main() => integrationDriver();
