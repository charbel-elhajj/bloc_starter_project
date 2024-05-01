import 'package:bloc_starter_project/app.dart';
import 'package:flutter/material.dart';

Widget testableWidgetFactory(Widget child) {
  return App(home: child);
}
