import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/network/error_message_model.dart';
import '../../domain/entities/product_rate.dart';
import '../../domain/repository/base_product_repository.dart';
import '../../domain/usecases/get_product_rates_usecase.dart';
import '../../domain/usecases/get_product_usecase.dart';
import '../datasource/product_remote_datasource.dart';
import '../model/product_model.dart';

class ProductRepository extends BaseProductRepository {
  final BaseProductRemoteDatasource baseProductRemoteDatasource;

  ProductRepository(this.baseProductRemoteDatasource);
  @override
  Future<Either<Failure, ProductModel>> getProduct(ProductPrams prams) async {
    try {
      final result = await baseProductRemoteDatasource.getProduct(prams);
      return Right(result);
    } on ErrorMessageModel catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ProductRate>>> getProductRates(ProductRatePrams prams) async {
    try {
      final result = await baseProductRemoteDatasource.getProductRate(prams);
      return Right(result);
    } on ErrorMessageModel catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
