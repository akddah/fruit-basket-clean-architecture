import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_usecase.dart';
import '../entities/home_categories.dart';
import '../entities/home_products.dart';
import '../entities/home_slider.dart';
import '../usecases/home_products_usecase.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<HomeSlider>>> homeSlider(NoPrams prams);
  Future<Either<Failure, List<HomeProducts>>> homeProducts(ProductsPrams prams);
  Future<Either<Failure, List<HomeCategories>>> homeCategories(NoPrams prams);
}
