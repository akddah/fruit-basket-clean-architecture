import 'package:fruit_basket/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_basket/core/use_case/base_usecase.dart';

import '../../../../domain/repository/base_home_repository.dart';
import '../entities/home_slider.dart';

class HomeSliderUsecase extends BaseUseCase<List<HomeSlider>, NoPrams> {
  final BaseHomeRepository baseHomeRepository;

  HomeSliderUsecase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<HomeSlider>>> call(NoPrams prams) {
    return baseHomeRepository.homeSlider(prams);
  }
}
