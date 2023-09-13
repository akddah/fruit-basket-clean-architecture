import 'package:fruit_basket/data/datasource/addressess_remote_datasource.dart';
import 'package:fruit_basket/domain/entities/address.dart';
import 'package:fruit_basket/core/use_case/base_usecase.dart';
import 'package:fruit_basket/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_basket/domain/repository/base_address_repository.dart';
import 'package:fruit_basket/domain/usecases/address_update_usecase.dart';
import 'package:fruit_basket/domain/usecases/address_insert_usecase.dart';
import 'package:fruit_basket/domain/usecases/address_delete_usecash.dart';

import '../../core/network/error_message_model.dart';

class AddressessRepository extends BaseAddressRepository {
  final BaseAddressessRemoteDatasource baseAddressessRemoteDatasource;

  AddressessRepository(this.baseAddressessRemoteDatasource);
  @override
  Future<Either<Failure, Address>> deleteAddress(AddressDeletePrams prams) async {
    try {
      final result = await baseAddressessRemoteDatasource.deleteAddress(prams);
      return Right(result);
    } on ErrorMessageModel catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Address>>> getAddressess(NoPrams prams) async {
    try {
      final result = await baseAddressessRemoteDatasource.getAddressess(prams);
      return Right(result);
    } on ErrorMessageModel catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Address>> insertAddress(InsertAddressPrams prams) async {
    try {
      final result = await baseAddressessRemoteDatasource.insertAddress(prams);
      return Right(result);
    } on ErrorMessageModel catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Address>> updateAddress(UpdateAddressPrams prams) async {
    try {
      final result = await baseAddressessRemoteDatasource.updateAddress(prams);
      return Right(result);
    } on ErrorMessageModel catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
