import 'package:flutter_clean_architecture/src/data/repositories/article_repository.dart';
import 'package:flutter_clean_architecture/src/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => AuthRepositoryImpl());
    Get.lazyPut(() => ArticleRepositoryImpl());
  }
}
