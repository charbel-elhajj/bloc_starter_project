import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async => await GoldenToolkit.runWithConfiguration(
      () async {
        TestWidgetsFlutterBinding.ensureInitialized();
        await loadAppFonts();
        await testMain();
      },
      config: GoldenToolkitConfiguration(
        deviceFileNameFactory: _buildDeviceName,
      ),
    );

String _buildDeviceName(String name, Device device) {
  return '$name/${device.name}.png';
}
