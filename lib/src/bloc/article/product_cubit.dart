import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togumogu/src/bloc/article/result_state.dart';

import 'package:togumogu/src/models/products/product.dart';
import 'package:togumogu/src/repository/beta_api_repository.dart';
import 'package:togumogu/src/services/api_result.dart';
import 'package:togumogu/src/services/network_exceptions.dart';

class ProductCubit extends Cubit<ResultState<List<Product>>> {
  final BetaAPIRepository apiRepository;

  ProductCubit({this.apiRepository})
      : assert(apiRepository != null),
        super(Idle());

  loadCatWiseProd(String cat) async {
    emit(ResultState.loading());
    ApiResult<List<Product>> apiResult =
        await apiRepository.fetchCatWiseProd(cat);
    apiResult.when(
      success: (List<Product> data) {
        emit(ResultState.data(data: data));
      },
      failure: (NetworkExceptions error) {
        emit(ResultState.error(error: error));
      },
    );
  }
}
