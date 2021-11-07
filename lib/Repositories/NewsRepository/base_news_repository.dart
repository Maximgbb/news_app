import 'package:news_app/Models/models.dart';
import 'package:news_app/Repositories/repositories.dart';

abstract class BaseNewsRepository extends BaseRepository {
  Future<News> getTopHeadlinesNews();
}
