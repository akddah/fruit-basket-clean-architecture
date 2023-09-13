import 'package:equatable/equatable.dart';
import '../../../../core/use_case/base_usecase.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../domain/repository/base_product_repository.dart';
import '../entities/product.dart';

class GetProductUsecase extends BaseUseCase<Product, ProductPrams> {
  final BaseProductRepository baseProductRepository;

  GetProductUsecase(this.baseProductRepository);

  @override
  Future<Either<Failure, Product>> call(ProductPrams prams) async {
    return baseProductRepository.getProduct(prams);
  }
}

class ProductPrams extends Equatable {
  final int id;

  const ProductPrams(this.id);

  @override
  List<Object?> get props => [id];
}
