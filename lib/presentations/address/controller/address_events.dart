

abstract class AddressEvents {}

class GetAddressesEvent extends AddressEvents {}

class DeleteAddressEvent extends AddressEvents {
  final int addressId;

  DeleteAddressEvent(this.addressId);
}

class InsertAddressEvent extends AddressEvents {}

class UpdateAddressEvent extends AddressEvents {
  final int addressId;

  UpdateAddressEvent(this.addressId);
}
