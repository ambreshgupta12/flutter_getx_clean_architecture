import 'package:flutter_clean_architecture/src/data/datasource/network/apis/article_api.dart';
import 'package:flutter_clean_architecture/src/data/models/paging_model.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  @override
  Future<PagingModel> fetchHeadLine(int page, int pageSize) async {
    final response = await ArticleAPI.fetchHeadline(page, pageSize).request();
    return PagingModel.fromJson(response);
  }

  @override
  Future<PagingModel> fetchNewByCategory(String keyword, int page, int pageSize) async {
    final response = await ArticleAPI.fetchNews(keyword, page, pageSize).request();
    return PagingModel.fromJson(response);
  }
}
