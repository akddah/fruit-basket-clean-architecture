
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_basket/core/error/failure.dart';
import 'package:fruit_basket/core/use_case/base_usecase.dart';
import 'package:fruit_basket/domain/entities/address.dart';
import 'package:fruit_basket/domain/repository/base_address_repository.dart';

class UpdateAddressUsecase extends BaseUseCase<Address, UpdateAddressPrams> {
  final BaseAddressRepository baseAddressRepository;

  UpdateAddressUsecase(this.baseAddressRepository);
  @override
  Future<Either<Failure, Address>> call(UpdateAddressPrams prams) {
    return baseAddressRepository.updateAddress(prams);
  }
}

class UpdateAddressPrams extends Equatable {
  final String type, phone, description, location, lat, lng, isDefault;
  final int addressId;
  const UpdateAddressPrams({
    required this.type,
    required this.phone,
    required this.description,
    required this.location,
    required this.lat,
    required this.lng,
    required this.isDefault,
    required this.addressId,
  });
  Map<String, dynamic> get body => {
        "_method": "PUT",
        "type": type,
        "phone": phone,
        "description": description,
        "location": location,
        "lat": lat,
        "lng": lng,
        "is_default": isDefault,
      };
  @override
  List<Object?> get props => [type, phone, description, location, lat, lng, isDefault, addressId];
}
