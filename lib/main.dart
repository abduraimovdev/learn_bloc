import 'package:flutter/material.dart';

import 'src/common/core/service_locator.dart';
import 'src/common/widget/app.dart';

void main() {
  setupLocator();
  runApp(const ContactApp());
}
