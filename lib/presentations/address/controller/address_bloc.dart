import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import '../../../domain/usecases/address_delete_usecash.dart';
import '../../../domain/usecases/address_insert_usecase.dart';
import '../../../domain/usecases/address_update_usecase.dart';
import '../../../domain/usecases/addresses_get_usecase.dart';
import 'address_events.dart';
import 'address_state.dart';

import '../../../core/use_case/base_usecase.dart';

class AddressBloc extends Bloc<AddressEvents, AddressState> {
  final GetAddressessUsecase getAddressessUsecase;
  final AddressDeleteUsecase addressDeleteUsecase;
  final InsertAddressUsecase insertAddressUsecase;
  final UpdateAddressUsecase updateAddressUsecase;
  AddressBloc(this.getAddressessUsecase, this.addressDeleteUsecase, this.insertAddressUsecase, this.updateAddressUsecase)
      : super(const AddressState()) {
    on<GetAddressesEvent>(_getAddress);
  }

  Future<void> _getAddress(GetAddressesEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(getAddressessState: RequestState.isLoading));
    final result = await getAddressessUsecase(NoPrams());
    // print("[][][][] $result");
    result.fold(
      (l) => emit(state.copyWith(getAddressessState: RequestState.isError, getAddressessMsg: l.message)),
      (r) => emit(
        state.copyWith(
          addressess: r,
          getAddressessState: RequestState.isLoaded,
          defaultAddress: r.firstWhere((element) => element.isDefault),
        ),
      ),
    );
  }
}
