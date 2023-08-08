import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/src/app/config/app_colors.dart';
import 'package:flutter_clean_architecture/src/app/types/tab_type.dart';
import 'package:flutter_clean_architecture/src/presentation/controllers/auth/auth_binding.dart';
import 'package:flutter_clean_architecture/src/presentation/controllers/auth/auth_controller.dart';
import 'package:flutter_clean_architecture/src/presentation/controllers/headline/headline_binding.dart';
import 'package:flutter_clean_architecture/src/presentation/controllers/news/news_binding.dart';
import 'package:flutter_clean_architecture/src/presentation/pages/headline/headline_page.dart';
import 'package:flutter_clean_architecture/src/presentation/pages/news/news_page.dart';
import 'package:flutter_clean_architecture/src/presentation/pages/profile/profile_page.dart';
import 'package:get/get.dart';

class HomePage extends GetView<AuthController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBuilder: (context, index) {
          final type = TabType.values[index];
          switch (type) {
            case TabType.headline:
              HeadLineBinding().dependencies();
              return HeadlinePage();
            case TabType.profile:
              AuthBinding().dependencies();
              return const ProfilePage();
            case TabType.news:
              NewsBinding().dependencies();
              return const NewsPage();
          }
        },
        tabBar: CupertinoTabBar(
          inactiveColor: AppColors.lightGray,
          activeColor: AppColors.primary,
          items: TabType.values
              .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.title))
              .toList(),
        ));
  }
}
