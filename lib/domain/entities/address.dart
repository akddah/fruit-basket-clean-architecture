
import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int id;
  final String type, location, phone;
  final String? decription;
  final bool isDefault;
  final double lat, lng;

  const Address(this.id, this.type, this.location, this.decription, this.phone, this.isDefault, this.lat, this.lng);

  @override
  List<Object?> get props => [id, type, location, decription, phone, isDefault, lat, lng];
}
