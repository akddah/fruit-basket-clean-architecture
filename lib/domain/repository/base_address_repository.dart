import 'package:dartz/dartz.dart';
import 'package:fruit_basket/domain/entities/address.dart';
import 'package:fruit_basket/domain/usecases/address_insert_usecase.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_usecase.dart';
import '../usecases/address_delete_usecash.dart';
import '../usecases/address_update_usecase.dart';

abstract class BaseAddressRepository {
  Future<Either<Failure, List<Address>>> getAddressess(NoPrams prams);

  Future<Either<Failure, Address>> insertAddress(InsertAddressPrams prams);

  Future<Either<Failure, Address>> updateAddress(UpdateAddressPrams prams);

  Future<Either<Failure, Address>> deleteAddress(AddressDeletePrams prams);
}
