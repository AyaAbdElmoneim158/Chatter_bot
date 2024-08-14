import '/utils/di/locator.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  setUpLocator();
  runApp(const App());
}
