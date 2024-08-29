import 'package:flutter/material.dart';

import 'src/config/injector/injector_conf.dart';
import 'src/my_app.dart';

void main() {
  initializeDependencies();
  runApp(const MyApp());
}
