import 'package:dartz/dartz.dart';
import 'package:fruit_basket/domain/usecases/login_usecase.dart';

import '../../core/error/failure.dart';
import '../entities/login.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, Login>> login(LoginPrams prams);
}
