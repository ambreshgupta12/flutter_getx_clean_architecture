import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/app/types/category_type.dart';
import 'package:flutter_clean_architecture/src/presentation/controllers/news/news_controller.dart';
import 'package:flutter_clean_architecture/src/presentation/pages/detail/detail_page.dart';
import 'package:flutter_clean_architecture/src/presentation/widgets/article_widget.dart';
import 'package:get/get.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final _scrollController = ScrollController();

  final controller = Get.find<NewsController>();

  var _currentCategory = CategoryType.bitcoin;

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: controller,
        initState: (newState) {
          controller.fetchData(_currentCategory.keyword);
        },
        didUpdateWidget: (oldState, newState) {
          _scrollController.addListener(() => _scrollListener);
        },
        builder: (_) {
          return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: const Text('News'),
                trailing: TextButton(
                  onPressed: () {
                    _selectCategory(context);
                  },
                  child: Text(_currentCategory.keyword.toUpperCase()),
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.articles.length,
                controller: _scrollController,
                itemBuilder: (BuildContext context, int index) {
                  final article = controller.articles[index];
                  return GestureDetector(
                      onTap: () {
                        Get.to(DetailPage(article: article));
                      },
                      child: ArticleWidget(article: article));
                },
              ));
        });
  }

  _selectCategory(BuildContext context) {
    final actions = CategoryType.values
        .map((e) => CupertinoActionSheetAction(
            onPressed: () {
              _currentCategory = e;
              controller.fetchData(e.keyword);
              Navigator.pop(context);
            },
            child: Text(e.keyword.capitalizeFirst ?? "")))
        .toList();
    showCupertinoModalPopup<void>(
        context: context,
        builder: (_) => CupertinoActionSheet(
              actions: actions,
              title: const Text('Select category'),
            ));
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
      print("load more");
      controller.loadMore(_currentCategory.keyword);
    }
  }
}
