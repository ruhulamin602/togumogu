
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togumogu/src/bloc/movie/result_state.dart';
import 'package:togumogu/src/models/articles/articles.dart';
import 'package:togumogu/src/repository/api_repository.dart';
import 'package:togumogu/src/services/api_result.dart';
import 'package:togumogu/src/services/network_exceptions.dart';


class ArticleCubit extends Cubit<ResultState<List<Articles>>> {
  final APIRepository apiRepository;

  ArticleCubit({this.apiRepository})
      : assert(apiRepository != null),
        super(Idle());

  loadArticles() async {
    emit(ResultState.loading());
    ApiResult<List<Articles>> apiResult = await apiRepository.fetchArticleList();
    apiResult.when(success: (List<Articles> data) {
      emit(ResultState.data(data: data));
    }, failure: (NetworkExceptions error) {
      emit(ResultState.error(error: error));
    });
  }
  
}
