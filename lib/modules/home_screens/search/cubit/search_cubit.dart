import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/home_screens/search/cubit/search_states.dart';

import '../../../../models/search/search.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/endpoint/end_point.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitState());

  static SearchCubit get(context) => BlocProvider.of(context);
  DioHelper dio = DioHelper();
  SearchModel? searchModel;

  void searchProduct(String product) {
    emit(SearchLoadingState());
    dio.postDataToApi(
      url: productsSearch,
      token: token,
      data: {
        "text": product,
      },
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      if (kDebugMode) {
        print(
            '**************************** Search Acc Data Successfully To Api ****************************');
        print(searchModel?.status);
        print(
            '**************************** Search Acc Data Successfully To Api ****************************');
      }
      emit(SearchSuccessState());
    }).catchError((onError) {
      emit(SearchFailState());
      if (kDebugMode) {
        print(
            '********************************** Error from Search API **********************************');
        print('Error From Search ${onError.toString()}');
        print(
            '********************************** Error from Search API **********************************');
      }
    });
  }
}
