import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/product.dart';
import '../entities/product_rate.dart';
import '../usecases/get_product_rates_usecase.dart';
import '../usecases/get_product_usecase.dart';

abstract class BaseProductRepository {
  Future<Either<Failure, Product>> getProduct(ProductPrams prams);
  Future<Either<Failure, List<ProductRate>>> getProductRates(ProductRatePrams prams);
}
