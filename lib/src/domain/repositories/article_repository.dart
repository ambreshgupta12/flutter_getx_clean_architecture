import 'package:flutter_clean_architecture/src/domain/entities/paging.dart';

abstract class ArticleRepository{
  Future<Paging> fetchHeadLine(int page,int pageSize);
  Future<Paging> fetchNewByCategory(String keyword,int page,int pageSize);
}
