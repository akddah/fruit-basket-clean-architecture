import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_basket/core/error/failure.dart';
import 'package:fruit_basket/core/use_case/base_usecase.dart';
import 'package:fruit_basket/domain/entities/address.dart';
import 'package:fruit_basket/domain/repository/base_address_repository.dart';

class AddressDeleteUsecase extends BaseUseCase<Address, AddressDeletePrams> {
  final BaseAddressRepository baseAddressRepository;

  AddressDeleteUsecase(this.baseAddressRepository);

  @override
  Future<Either<Failure, Address>> call(AddressDeletePrams prams) {
    return baseAddressRepository.deleteAddress(prams);
  }
}

class AddressDeletePrams extends Equatable {
  final int addressId;
  const AddressDeletePrams({required this.addressId});

  @override
  List<Object?> get props => [addressId];
}
