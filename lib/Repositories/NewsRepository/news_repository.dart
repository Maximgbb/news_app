import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Models/models.dart';
import 'package:news_app/.env.dart';
import 'package:news_app/Repositories/NewsRepository/base_news_repository.dart';

class NewsRepository extends BaseNewsRepository {
  static const String _newsAPIUrl = 'https://newsapi.org/v2';
  final http.Client _httpClient;

  NewsRepository({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  @override
  void dispose() {
    _httpClient.close();
  }

  @override
  Future<News> getTopHeadlinesNews() async {
    final url = Uri.parse(
      '$_newsAPIUrl/top-headlines?country=us&apiKey=$newsAPIKey',
    );

    final response = await _httpClient.get(url);

    if (response.statusCode == 200) {
      final News newsData = News.fromJson(json.decode(response.body));
      return newsData;
    }

    throw Exception('Error: no response');
  }
}
