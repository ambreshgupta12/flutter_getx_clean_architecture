import 'package:flutter_clean_architecture/src/data/repositories/article_repository.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/fetch_headline_use_case.dart';
import 'package:get/get.dart';

import 'headline_controller.dart';

class HeadLineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchHeadlineUseCase(Get.find<ArticleRepositoryImpl>()));
    Get.lazyPut(() => HeadLineController(Get.find()));
  }
}
