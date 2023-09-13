import 'package:fruit_basket/core/network/dio.dart';
import 'package:fruit_basket/core/use_case/base_usecase.dart';
import 'package:fruit_basket/core/utils/app_constents.dart';

import '../../core/network/error_message_model.dart';
import '../../domain/usecases/home_products_usecase.dart';
import '../model/home_category_model.dart';
import '../model/home_product_model.dart';
import '../model/slider_model.dart';

abstract class BaseHomeRemoteDatasource {
  final DioHelper dioHelper;

  BaseHomeRemoteDatasource(this.dioHelper);
  Future<List<HomeSliderModel>> getHomeSliders(NoPrams prams);
  Future<List<HomeCategoryModel>> getHomeCategories(NoPrams prams);
  Future<List<HomeProductModel>> getHomeProducts(ProductsPrams prams);
}

class HomeRemoteDatasource extends BaseHomeRemoteDatasource {
  HomeRemoteDatasource(super.dioHelper);

  @override
  Future<List<HomeCategoryModel>> getHomeCategories(NoPrams prams) async {
    final result = await dioHelper.get(AppConstances.homeCategories);
    if (result.statusCode == 200) {
      return List<HomeCategoryModel>.from(result.data["data"].map((e) => HomeCategoryModel.fromJson(e)));
    } else {
      throw ErrorMessageModel.fromJson(result.data);
    }
  }

  @override
  Future<List<HomeProductModel>> getHomeProducts(ProductsPrams prams) async {
    final result = await dioHelper.get(AppConstances.homeProducts);
    if (result.statusCode == 200) {
      return List<HomeProductModel>.from(result.data["data"].map((e) => HomeProductModel.fromJson(e)));
    } else {
      throw ErrorMessageModel.fromJson(result.data);
    }
  }

  @override
  Future<List<HomeSliderModel>> getHomeSliders(NoPrams prams) async {
    final result = await dioHelper.get(AppConstances.homeSlider);
    if (result.statusCode == 200) {
      return List<HomeSliderModel>.from(result.data["data"].map((e) => HomeSliderModel.fromJson(e)));
    } else {
      throw ErrorMessageModel.fromJson(result.data);
    }
  }
}
