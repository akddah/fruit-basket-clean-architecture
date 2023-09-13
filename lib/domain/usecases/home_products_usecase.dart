import 'package:equatable/equatable.dart';
import 'package:fruit_basket/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_basket/core/use_case/base_usecase.dart';
import 'package:fruit_basket/domain/repository/base_home_repository.dart';

import '../entities/home_products.dart';

class HomeProductsUseCase extends BaseUseCase<List<HomeProducts>, ProductsPrams> {
  final BaseHomeRepository baseHomeRepository;

  HomeProductsUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, List<HomeProducts>>> call(ProductsPrams prams) {
    return baseHomeRepository.homeProducts(prams);
  }
}

class ProductsPrams extends Equatable {
  final String? keyword;

  const ProductsPrams([this.keyword]);

  Map<String, dynamic> get body => {"keyword": keyword};

  @override
  List<Object?> get props => [keyword];
}
