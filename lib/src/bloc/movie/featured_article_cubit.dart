
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togumogu/src/bloc/movie/article.dart';
import 'package:togumogu/src/models/articles/articles.dart';
import 'package:togumogu/src/repository/api_repository.dart';
import 'package:togumogu/src/services/api_result.dart';
import 'package:togumogu/src/services/network_exceptions.dart';

class FeaturedArticleCubit extends Cubit<ResultState<Articles>> {
  final APIRepository apiRepository;

  FeaturedArticleCubit({this.apiRepository})
      : assert(apiRepository != null),
        super(Idle());

  loadFeaturedArticle() async {
    emit(ResultState.loading());
    ApiResult<Articles> apiResult = await apiRepository.fetchEditorPick();
    print(apiResult);
    apiResult.when(success: (Articles data) {
      emit(ResultState.data(data: data));
    }, failure: (NetworkExceptions error) {
      emit(ResultState.error(error: error));
    });
  }
}
