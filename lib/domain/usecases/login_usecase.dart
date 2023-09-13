
import 'package:equatable/equatable.dart';
import 'package:fruit_basket/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_basket/core/use_case/base_usecase.dart';
import 'package:fruit_basket/domain/entities/login.dart';
import 'package:fruit_basket/domain/repository/base_auth_repository.dart';

class LoginUseCase extends BaseUseCase<Login, LoginPrams> {
  final BaseAuthRepository baseAuthRepository;

  LoginUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, Login>> call(LoginPrams prams) async {
    return await baseAuthRepository.login(prams);
  }
}

class LoginPrams extends Equatable {
  final String phone, password, coutryCode, deviceToken, type;

  const LoginPrams({
    required this.type,
    required this.deviceToken,
    required this.coutryCode,
    required this.phone,
    required this.password,
  });
  Map<String, dynamic> get body => {
        "phone": phone,
        "password": password,
        "country_code": coutryCode,
        "device_token": deviceToken,
        "type": type,
        "user_type": "client",
      };
  @override
  List<Object?> get props => [phone, password, coutryCode];
}
