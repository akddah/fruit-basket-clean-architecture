import '../datasource/favorite_remote_datasource.dart';
import '../../core/use_case/base_usecase.dart';
import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/base_favorite_repository.dart';
import '../../domain/usecases/add_favorite_usecase.dart';

import '../../core/network/error_message_model.dart';
import '../../domain/usecases/remove_favorite_usecase.dart';
import '../model/home_product_model.dart';

class FavoriteRepository extends BaseFavoriteRepository {
  final BaseFavoriteRemoteDatasource baseFavoriteRemoteDatasource;

  FavoriteRepository(this.baseFavoriteRemoteDatasource);

  @override
  Future<Either<Failure, String>> addToFavorite(AddFavoritePrams prams) async {
    try {
      final result = await baseFavoriteRemoteDatasource.addFavorite(prams);
      return Right(result);
    } on ErrorMessageModel catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<HomeProductModel>>> getFavorite(NoPrams prams) async {
    try {
      final result = await baseFavoriteRemoteDatasource.getFavorite(prams);
      return Right(result);
    } on ErrorMessageModel catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> removeFromFavorite(RemoveFavoritePrams prams) async {
    try {
      final result = await baseFavoriteRemoteDatasource.removeFavorite(prams);
      return Right(result);
    } on ErrorMessageModel catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
