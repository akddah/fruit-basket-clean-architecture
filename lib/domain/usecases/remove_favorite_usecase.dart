import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_usecase.dart';
import '../../../../domain/repository/base_favorite_repository.dart';

class RemoveFavoriteUsecase extends BaseUseCase<String, RemoveFavoritePrams> {
  final BaseFavoriteRepository baseFavoriteRepository;

  RemoveFavoriteUsecase(this.baseFavoriteRepository);
  @override
  Future<Either<Failure, String>> call(RemoveFavoritePrams prams) async {
    return baseFavoriteRepository.removeFromFavorite(prams);
  }
}

class RemoveFavoritePrams extends Equatable {
  final int productId;
  const RemoveFavoritePrams(this.productId);

  @override
  List<Object?> get props => [productId];
}
