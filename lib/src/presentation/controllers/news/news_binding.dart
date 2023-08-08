import 'package:flutter_clean_architecture/src/data/repositories/article_repository.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/fetch_news_use_case.dart';
import 'package:flutter_clean_architecture/src/presentation/controllers/news/news_controller.dart';
import 'package:get/get.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchNewsUseCase(Get.find<ArticleRepositoryImpl>()));
    Get.lazyPut(() => NewsController(Get.find<FetchNewsUseCase>()));
  }
}
