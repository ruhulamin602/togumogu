import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:togumogu/src/models/articles/article_response.dart';
import 'package:togumogu/src/models/articles/articles.dart';
import 'package:togumogu/src/models/articles/featured_article_response.dart';
import 'package:togumogu/src/services/api_result.dart';
import 'package:togumogu/src/services/dio_client.dart';
import 'package:togumogu/src/services/network_exceptions.dart';

class APIRepository {
  DioClient dioClient;

  String _baseUrl = FlutterConfig.get("API_URL");

  APIRepository() {
    var dio = Dio();

    dioClient = DioClient(_baseUrl, dio);
  }

  Future<ApiResult<List<Articles>>> fetchArticleList() async {
    try {
      final response = await dioClient.get(
        "/en/v1/latest-article",
        queryParameters: {"per_page": 4},
      );
      List<Articles> articleList = ArticleResponse.fromJson(response).data;
      // print(response);
      return ApiResult.success(data: articleList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<Articles>> fetchEditorPick() async {
    try {
      final response = await dioClient.get("/en/v1/featured-article");
      Articles article = FeaturedArticleResponse.fromJson(response).data;
      // print(response);
      return ApiResult.success(data: article);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
