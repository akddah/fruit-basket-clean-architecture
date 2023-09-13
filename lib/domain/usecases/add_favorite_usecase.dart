import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_usecase.dart';
import '../repository/base_favorite_repository.dart';

class AddFavoriteUsecase extends BaseUseCase<String, AddFavoritePrams> {
  final BaseFavoriteRepository baseFavoriteRepository;

  AddFavoriteUsecase(this.baseFavoriteRepository);

  @override
  Future<Either<Failure, String>> call(AddFavoritePrams prams) async {
    return baseFavoriteRepository.addToFavorite(prams);
  }
}

class AddFavoritePrams extends Equatable {
  final int productId;

  const AddFavoritePrams(this.productId);
  @override
  List<Object?> get props => [productId];
}
