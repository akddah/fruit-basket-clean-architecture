import 'package:fruit_basket/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_basket/core/use_case/base_usecase.dart';
import 'package:fruit_basket/domain/repository/base_favorite_repository.dart';

import '../entities/home_products.dart';

class GetFavoriteUsecase extends BaseUseCase<List<HomeProducts>, NoPrams> {
  final BaseFavoriteRepository baseFavoriteRepository;

  GetFavoriteUsecase(this.baseFavoriteRepository);
  @override
  Future<Either<Failure, List<HomeProducts>>> call(NoPrams prams) async {
    return baseFavoriteRepository.getFavorite(prams);
  }
}
