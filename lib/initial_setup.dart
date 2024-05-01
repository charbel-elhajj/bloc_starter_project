import 'package:flutter/material.dart';
import 'package:bloc_starter_project/injection_container.dart' as di;

Future<void> launchInitialSetup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
}
