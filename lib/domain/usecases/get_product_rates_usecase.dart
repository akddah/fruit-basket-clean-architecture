import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_usecase.dart';
import '../../../../domain/repository/base_product_repository.dart';
import '../entities/product_rate.dart';

class GetProductRateUsecase extends BaseUseCase<List<ProductRate>, ProductRatePrams> {
  final BaseProductRepository baseProductRepository;

  GetProductRateUsecase(this.baseProductRepository);
  @override
  Future<Either<Failure, List<ProductRate>>> call(ProductRatePrams prams) {
    return baseProductRepository.getProductRates(prams);
  }
}

class ProductRatePrams extends Equatable {
  final int productId;

  const ProductRatePrams(this.productId);
  @override
  List<Object?> get props => [productId];
}
