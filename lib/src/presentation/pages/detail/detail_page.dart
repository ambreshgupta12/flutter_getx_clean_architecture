import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/app/config/app_text_styles.dart';
import 'package:flutter_clean_architecture/src/domain/entities/article.dart';

class DetailPage extends StatelessWidget {
  final Article article;

  const DetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Detail'),
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Text(article.title ?? '', style: AppTextStyles.title),
              const SizedBox(
                height: 10,
              ),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  placeholder: (context, url) => const CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey,
                  ),
                  memCacheHeight: 150,
                  memCacheWidth: 150,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                article.content ?? "",
                style: AppTextStyles.body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
