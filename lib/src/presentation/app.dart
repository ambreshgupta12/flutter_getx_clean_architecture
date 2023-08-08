import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/src/presentation/controllers/auth/auth_binding.dart';
import 'package:flutter_clean_architecture/src/presentation/pages/home/home_page.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      initialRoute: '/',
      initialBinding: AuthBinding(),
      home: const HomePage(),
    );
  }
}
