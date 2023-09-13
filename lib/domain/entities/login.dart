import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final int id;
  final String name, token, phone;

  const Login(this.id, this.name, this.token, this.phone);

  @override
  List<Object?> get props => [id, name, token];
}
