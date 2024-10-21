import 'package:flutter/foundation.dart';

class ArticleModel {
  final String? image;
  final String? title;
  final String? subtitle;
  final String? url; // New field for article URL

  ArticleModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.url,
  });

  // Factory constructor to create an ArticleModel from JSON
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      subtitle: json['description'],
      url: json['url'],
    );
  }
}
