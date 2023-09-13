import 'dart:developer';
import 'package:fruit_basket/domain/usecases/add_favorite_usecase.dart';
import '../../core/network/dio.dart';
import '../../core/network/error_message_model.dart';
import '../../core/use_case/base_usecase.dart';
import '../../core/utils/app_constents.dart';
import '../../domain/usecases/remove_favorite_usecase.dart';
import '../model/home_product_model.dart';

abstract class BaseFavoriteRemoteDatasource {
  final DioHelper dioHelper;

  BaseFavoriteRemoteDatasource(this.dioHelper);

  Future<List<HomeProductModel>> getFavorite(NoPrams prams);
  Future<String> addFavorite(AddFavoritePrams prams);
  Future<String> removeFavorite(RemoveFavoritePrams prams);
}

class FavoriteRemoteDatasourc extends BaseFavoriteRemoteDatasource {
  FavoriteRemoteDatasourc(super.dioHelper);

  @override
  Future<List<HomeProductModel>> getFavorite(NoPrams prams) async {
    final result = await dioHelper.get(AppConstances.getFavorite);
    if (result.statusCode == 200) {
      return List<HomeProductModel>.from(result.data["data"].map((e) => HomeProductModel.fromJson(e)));
    } else {
      throw ErrorMessageModel.fromJson(result.data);
    }
  }

  @override
  Future<String> addFavorite(AddFavoritePrams prams) async {
    final result = await dioHelper.post(AppConstances.addToFavorite(prams.productId));
    if (result.statusCode == 201) {
      return result.data["message"];
    } else {
      throw ErrorMessageModel.fromJson(result.data);
    }
  }

  @override
  Future<String> removeFavorite(RemoveFavoritePrams prams) async {
    final result = await dioHelper.post(AppConstances.removeFromFavorite(prams.productId));
    log(result.statusCode.toString());
    if (result.statusCode == 200) {
      return result.data["message"];
    } else {
      throw ErrorMessageModel.fromJson(result.data);
    }
  }
}
