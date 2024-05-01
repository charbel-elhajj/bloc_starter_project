import 'package:bloc_starter_project/app.dart';
import 'package:bloc_starter_project/initial_setup.dart';
import 'package:flutter/material.dart';

void main() async {
  await launchInitialSetup();

  runApp(const App());
}
