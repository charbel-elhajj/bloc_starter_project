import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart' as toolkit;

class Devices {
  static toolkit.Device get webBrowser => const toolkit.Device(
        name: 'browser',
        size: Size(1366, 1024),
      );

  static toolkit.Device get iphone12ProMax => const toolkit.Device(
        size: Size(428.0, 926.0),
        name: 'iphone_12_pro_max',
        safeArea: EdgeInsets.only(top: 47.0, bottom: 34.0),
      );
}

final devices = [
  Devices.webBrowser,
  Devices.iphone12ProMax,
];
