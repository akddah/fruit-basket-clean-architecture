import '../../core/error/exceptions.dart';
import '../../core/network/error_message_model.dart';
import '../datasource/auth_remote_data_source.dart';
import '../../domain/entities/login.dart';
import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/base_auth_repository.dart';

class AuthRepositroy extends BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepositroy(this.baseAuthRemoteDataSource);

  @override
  Future<Either<Failure, Login>> login(prams) async {
    try {
      final result = await baseAuthRemoteDataSource.login(prams);
      return Right(result);
    } on ErrorMessageModel catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
