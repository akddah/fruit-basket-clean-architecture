
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_basket/core/error/failure.dart';
import 'package:fruit_basket/core/use_case/base_usecase.dart';
import 'package:fruit_basket/domain/entities/address.dart';
import 'package:fruit_basket/domain/repository/base_address_repository.dart';

class InsertAddressUsecase extends BaseUseCase<Address, InsertAddressPrams> {
  final BaseAddressRepository baseAddressRepository;

  InsertAddressUsecase(this.baseAddressRepository);
  @override
  Future<Either<Failure, Address>> call(InsertAddressPrams prams) {
    return baseAddressRepository.insertAddress(prams);
  }
}

class InsertAddressPrams extends Equatable {
  final String type, phone, description, location, lat, lng, isDefault;

  const InsertAddressPrams({
    required this.type,
    required this.phone,
    required this.description,
    required this.location,
    required this.lat,
    required this.lng,
    required this.isDefault,
  });
  Map<String, dynamic> get body => {
        "type": type,
        "phone": phone,
        "description": description,
        "location": location,
        "lat": lat,
        "lng": lng,
        "is_default": isDefault,
      };
  @override
  List<Object?> get props => [type, phone, description, location, lat, lng, isDefault];
}
