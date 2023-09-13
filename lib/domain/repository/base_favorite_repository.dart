import 'package:dartz/dartz.dart';
import '../../data/model/home_product_model.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_usecase.dart';
import '../usecases/add_favorite_usecase.dart';
import '../usecases/remove_favorite_usecase.dart';

abstract class BaseFavoriteRepository {
  Future<Either<Failure, List<HomeProductModel>>> getFavorite(NoPrams prams);
  Future<Either<Failure, String>> addToFavorite(AddFavoritePrams prams);
  Future<Either<Failure, String>> removeFromFavorite(RemoveFavoritePrams prams);
}
