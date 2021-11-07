import 'package:equatable/equatable.dart';
import 'dart:convert';
import 'models.dart';

class News extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;

  const News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory News.fromRawJson(String str) => News.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory News.fromJson(Map<String, dynamic> json) => News(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: List<Article>.from(
          json['articles'].map(
            (x) => Article.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': List<dynamic>.from(
          articles.map(
            (x) => x.toJson(),
          ),
        ),
      };

  @override
  List<Object?> get props => [status, totalResults, articles];

  @override
  bool? get stringify => true;
}
