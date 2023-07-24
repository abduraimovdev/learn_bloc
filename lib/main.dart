import 'package:flutter/material.dart';
import 'package:learn_bloc/app.dart';
import 'package:learn_bloc/core/service_locator.dart';

void main() {
  setupLocator();
  runApp(const ContactApp());
}
