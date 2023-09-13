import 'package:fruit_basket/domain/entities/address.dart';

class AddressModel extends Address {
  const AddressModel(
    super.id,
    super.type,
    super.location,
    super.decription,
    super.phone,
    super.isDefault,
    super.lat,
    super.lng,
  );
  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        json["id"],
        json["type"],
        json["location"],
        json["decription"],
        json["phone"],
        json["is_default"],
        json["lat"],
        json["lng"],
      );
}
