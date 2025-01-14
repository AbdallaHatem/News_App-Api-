import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
 final List<ArticleModel> articles ;

   NewsListView({
    super.key, required this.articles
  });


@override

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate(
              childCount: articles.length,
              (context,index)
              {
                return  Padding(
                  padding:  EdgeInsets.only(bottom: 25),
                  child:  NewsTile(
                    articleModel: articles[index],
                  ),
                );
              },
            ),
            );
  }
}