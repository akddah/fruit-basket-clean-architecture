import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../../domain/entities/address.dart';

class AddressState extends Equatable {
  final String getAddressessMsg;
  final RequestState getAddressessState;
  final List<Address> addressess;
  final Address? defaultAddress;
  const AddressState({
    this.getAddressessMsg = '',
    this.getAddressessState = RequestState.init,
    this.addressess = const [],
    this.defaultAddress,
  });
  AddressState copyWith({
    String? getAddressessMsg,
    RequestState? getAddressessState,
    List<Address>? addressess,
    Address? defaultAddress,
  }) {
    return AddressState(
      getAddressessMsg: getAddressessMsg ?? this.getAddressessMsg,
      getAddressessState: getAddressessState ?? this.getAddressessState,
      addressess: addressess ?? this.addressess,
      defaultAddress: defaultAddress ?? this.defaultAddress,
    );
  }

  @override
  List<Object?> get props => [getAddressessMsg, getAddressessState, addressess, defaultAddress];
}
