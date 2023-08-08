import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/src/presentation/controllers/headline/headline_controller.dart';
import 'package:flutter_clean_architecture/src/presentation/pages/detail/detail_page.dart';
import 'package:flutter_clean_architecture/src/presentation/widgets/article_widget.dart';
import 'package:get/get.dart';

/*
class HeadlinePage extends GetView<HeadLineController> {
  HeadlinePage({Key? key}) : super(key: key);
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (state) {
        controller.fetchHeadlineData();
      },
      didUpdateWidget: (oldState, previewState) {
        _scrollController.addListener(() => _scrollListener);
      },
      dispose: (state) {
        _scrollController.removeListener(() => _scrollListener);
      },
      builder: (_) {
        return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(middle: Text('Headline'),),
            child: ListView.builder(controller: _scrollController, itemBuilder: (context, index) {
              final article = controller.articles[index];
              return GestureDetector(onTap: () {
                Get.to(DetailPage(article: article));
              }, child: ArticleWidget(article: article),);
            }));
      },);
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
      print("load more");
      controller.loadMore();
    }
  }
}
*/

class HeadlinePage extends GetView<HeadLineController> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (state) {
        controller.fetchHeadlineData();
      },
      didUpdateWidget: (old, newState) {
        _scrollController.addListener(_scrollListener);
      },
      dispose: (state) {
        _scrollController.removeListener(_scrollListener);
      },
      builder: (_) {
        return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text('Headline'),
          ),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              final article = controller.articles[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailPage(article: article));
                },
                child: ArticleWidget(article: article),
              );
            },
          ),
        );
      },
    );
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
      print("load more");
      controller.loadMore();
    }
  }
}

