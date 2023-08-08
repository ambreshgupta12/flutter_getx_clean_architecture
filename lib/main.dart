import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/app/services/local_storage.dart';
import 'package:flutter_clean_architecture/src/app/utils/dependency.dart';
import 'package:flutter_clean_architecture/src/presentation/app.dart';
import 'package:get/get.dart';

void main() async {
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const App());
}

initServices() async {
  print('...starting services...');
  await Get.putAsync(() => LocalStorage().init());
  print('All services started...');
}
