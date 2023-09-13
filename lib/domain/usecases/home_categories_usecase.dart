import 'package:fruit_basket/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_basket/core/use_case/base_usecase.dart';
import 'package:fruit_basket/domain/repository/base_home_repository.dart';

import '../entities/home_categories.dart';

class HomeCategoriesUsecase extends BaseUseCase<List<HomeCategories>, NoPrams> {
  final BaseHomeRepository baseHomeRepository;

  HomeCategoriesUsecase(this.baseHomeRepository);
  @override
  Future<Either<Failure, List<HomeCategories>>> call(NoPrams prams) {
    return baseHomeRepository.homeCategories(prams);
  }
}
