import '../../core/network/dio.dart';
import '../../core/network/error_message_model.dart';
import '../../core/utils/app_constents.dart';
import '../../domain/usecases/login_usecase.dart';

import '../model/login_mode.dart';

abstract class BaseAuthRemoteDataSource {
  final DioHelper dioHelper;

  BaseAuthRemoteDataSource(this.dioHelper);
  Future<LoginModel> login(LoginPrams prams);
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  AuthRemoteDataSource(super.dioHelper);

  @override
  Future<LoginModel> login(prams) async {
    final result = await dioHelper.post(AppConstances.login, body: prams.body);
    if (result.statusCode == 200) {
      return LoginModel.fromJson(result.data["data"]);
    } else {
      throw ErrorMessageModel.fromJson(result.data);
    }
  }
}
