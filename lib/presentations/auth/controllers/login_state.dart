import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';

class LoginState extends Equatable {
  final String msg;
  final RequestState status;

  const LoginState({
    this.msg = '',
    this.status = RequestState.init,
  });
  LoginState copyWith({
    String? msg,
    RequestState? status,
  }) =>
      LoginState(msg: msg ?? this.msg, status: status ?? this.status);
  @override
  List<Object?> get props => [msg, status];
}
