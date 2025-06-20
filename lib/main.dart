

import 'package:flutter/material.dart';
import 'package:veda_learn/app.dart';
import 'package:veda_learn/app/service_locator/service_locator.dart';
import 'package:veda_learn/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  await HiveService().init();
  
  runApp(App());
}
