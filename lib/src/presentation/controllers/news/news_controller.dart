import 'package:flutter_clean_architecture/src/domain/entities/article.dart';
import 'package:flutter_clean_architecture/src/domain/entities/paging.dart';
import 'package:flutter_clean_architecture/src/domain/usecase/fetch_news_use_case.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class NewsController extends GetxController {
  final FetchNewsUseCase _fetchNewsUseCase;
  NewsController(this._fetchNewsUseCase);

  int _currentPage = 1;
  final int _pageSize = 20;
  var _isLoadMore = false;
  final _paging = Rx<Paging?>(null);

  var articles = RxList<Article>([]);

  fetchData(String keyword) async {
    _currentPage = 1;
    final newPaging = await _fetchNewsUseCase.execute(Tuple3(keyword, _currentPage, _pageSize));
    articles.assignAll(newPaging.articles);
    _paging.value = newPaging;
  }

  loadMore(String keyword) async {
    final totalResults = _paging.value?.totalResults ?? 0;
    if (totalResults / _pageSize <= _currentPage) return;
    if (_isLoadMore) return;
    _isLoadMore = true;
    _currentPage += 1;
    final newPaging = await _fetchNewsUseCase.execute(Tuple3(keyword, _currentPage, _pageSize));
    articles.addAll(newPaging.articles);
    _paging.value?.totalResults = newPaging.totalResults;
    _isLoadMore = false;
  }
}
