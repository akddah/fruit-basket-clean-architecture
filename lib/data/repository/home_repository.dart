import '../../core/network/error_message_model.dart';
import '../../domain/entities/home_categories.dart';
import '../../domain/entities/home_products.dart';
import '../../domain/entities/home_slider.dart';
import '../../domain/usecases/home_products_usecase.dart';
import '../datasource/home_remote_datasource.dart';
import '../../core/use_case/base_usecase.dart';
import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/base_home_repository.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseHomeRemoteDatasource baseHomeRemoteDatasource;

  HomeRepository(this.baseHomeRemoteDatasource);

  @override
  Future<Either<Failure, List<HomeCategories>>> homeCategories(NoPrams prams) async {
    try {
      final result = await baseHomeRemoteDatasource.getHomeCategories(prams);
      return Right(result);
    } on ErrorMessageModel catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<HomeProducts>>> homeProducts(ProductsPrams prams) async {
    try {
      final result = await baseHomeRemoteDatasource.getHomeProducts(prams);
      return Right(result);
    } on ErrorMessageModel catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<HomeSlider>>> homeSlider(NoPrams prams) async {
    try {
      final result = await baseHomeRemoteDatasource.getHomeSliders(prams);
      return Right(result);
    } on ErrorMessageModel catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
