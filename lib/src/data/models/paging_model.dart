
import 'package:flutter_clean_architecture/src/data/models/article_model.dart';
import 'package:flutter_clean_architecture/src/domain/entities/paging.dart';

class PagingModel extends Paging {
  PagingModel({
    required this.totalResults,
    required this.articles,
  }) : super(articles: articles, totalResults: totalResults);

  @override
  final int totalResults;
  @override
  final List<ArticleModel> articles;

  @override
  factory PagingModel.fromJson(Map<String, dynamic> json) => PagingModel(
        totalResults: json["totalResults"],
        articles:
            List.from(json["articles"].map((x) => ArticleModel.fromJson(x))),
      );
}
