import 'package:dartz/dartz.dart';
import 'package:fruit_basket/data/model/address_model.dart';

import '../../core/error/failure.dart';
import '../../core/network/dio.dart';
import '../../core/network/error_message_model.dart';
import '../../core/use_case/base_usecase.dart';
import '../../core/utils/app_constents.dart';
import '../../domain/entities/address.dart';
import '../../domain/usecases/address_delete_usecash.dart';
import '../../domain/usecases/address_insert_usecase.dart';
import '../../domain/usecases/address_update_usecase.dart';

abstract class BaseAddressessRemoteDatasource {
  final DioHelper dioHelper;

  BaseAddressessRemoteDatasource(this.dioHelper);
  Future<List<AddressModel>> getAddressess(NoPrams prams);

  Future<AddressModel> insertAddress(InsertAddressPrams prams);

  Future<AddressModel> updateAddress(UpdateAddressPrams prams);

  Future<AddressModel> deleteAddress(AddressDeletePrams prams);
}

class AddressessRemoteDatasource extends BaseAddressessRemoteDatasource {
  AddressessRemoteDatasource(super.dioHelper);

  @override
  Future<AddressModel> deleteAddress(AddressDeletePrams prams) async {
    final result = await dioHelper.post(AppConstances.addressDelete(prams.addressId), body: {"_method": "DELETE"});
    if (result.statusCode == 200) {
      return AddressModel.fromJson(result.data["data"]);
    } else {
      throw ErrorMessageModel.fromJson(result.data);
    }
  }

  @override
  Future<List<AddressModel>> getAddressess(NoPrams prams) async {
    final result = await dioHelper.get(AppConstances.addressessGet);
    if (result.statusCode == 200) {
      return List<AddressModel>.from(result.data["data"].map((e) => AddressModel.fromJson(e)));
    } else {
      throw ErrorMessageModel.fromJson(result.data);
    }
  }

  @override
  Future<AddressModel> insertAddress(InsertAddressPrams prams) async {
    final result = await dioHelper.post(AppConstances.addressInsert, body: prams.body);
    if (result.statusCode == 200) {
      return AddressModel.fromJson(result.data["data"]);
    } else {
      throw ErrorMessageModel.fromJson(result.data);
    }
  }

  @override
  Future<AddressModel> updateAddress(UpdateAddressPrams prams) async {
    final result = await dioHelper.post(AppConstances.addressUpdate(prams.addressId), body: prams.body);
    if (result.statusCode == 200) {
      return AddressModel.fromJson(result.data["data"]);
    } else {
      throw ErrorMessageModel.fromJson(result.data);
    }
  }
}
