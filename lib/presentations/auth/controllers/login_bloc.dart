import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_basket/core/utils/user_cashed.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../domain/usecases/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final UserCashed userCashed;
  LoginBloc(this.loginUseCase, this.userCashed) : super(const LoginState()) {
    on<ClickLoginEvent>(_login);
  }

  final phone = TextEditingController(text: "550011223344");
  final password = TextEditingController(text: "123456789");

  Future<FutureOr<void>> _login(ClickLoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: RequestState.isLoading));
    final result = await loginUseCase(LoginPrams(
      phone: phone.text,
      password: password.text,
      coutryCode: "966",
      deviceToken: "test",
      type: "ios",
    ));
    result.fold(
      (l) => emit(state.copyWith(msg: l.message, status: RequestState.isError)),
      (r) {
        userCashed.name = r.name;
        userCashed.phone = r.phone;
        userCashed.token = r.token;
        userCashed.set();
        emit(state.copyWith(status: RequestState.isLoaded));
      },
    );
  }
}
