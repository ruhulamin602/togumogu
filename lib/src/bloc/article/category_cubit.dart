import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togumogu/src/bloc/article/result_state.dart';
import 'package:togumogu/src/models/products/p_category.dart';
import 'package:togumogu/src/repository/beta_api_repository.dart';
import 'package:togumogu/src/services/api_result.dart';
import 'package:togumogu/src/services/network_exceptions.dart';

class CategoyCubit extends Cubit<ResultState<List<Category>>> {
  final BetaAPIRepository apiRepository;

  CategoyCubit({this.apiRepository})
      : assert(apiRepository != null),
        super(Idle());

  loadCategories() async {
    emit(ResultState.loading());
    ApiResult<List<Category>> apiResult = await apiRepository.fetchCatergories();
    apiResult.when(success: (List<Category> data) {
      emit(ResultState.data(data: data));
    }, failure: (NetworkExceptions error) {
      emit(ResultState.error(error: error));
    });
  }
  
}