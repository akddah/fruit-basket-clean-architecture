import 'package:dartz/dartz.dart';
import 'package:fruit_basket/domain/repository/base_address_repository.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_usecase.dart';
import '../entities/address.dart';

class GetAddressessUsecase extends BaseUseCase<List<Address>, NoPrams> {
  final BaseAddressRepository baseAddressRepository;

  GetAddressessUsecase(this.baseAddressRepository);
  @override
  Future<Either<Failure, List<Address>>> call(NoPrams prams) {
    return baseAddressRepository.getAddressess(prams);
  }
}
