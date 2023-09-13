import 'package:fruit_basket/domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel(super.id, super.name, super.token, super.phone);

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        json["id"],
        json["fullname"],
        json["token"],
        json["phone"],
      );
}
