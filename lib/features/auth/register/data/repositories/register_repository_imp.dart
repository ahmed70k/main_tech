import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/auth/register/domain/entities/register_response_entitiy.dart';
import '../../domain/repositories/register_remote_data_source.dart';
import '../../domain/repositories/register_repository.dart';
@Injectable(as: RegisterRepository)
class RegisterRepositoryImp implements RegisterRepository {
  // todo: add remote data source as a dependency
  final RegisterRemoteDataSourceInterface registerRemoteDataSource;
  RegisterRepositoryImp({required this.registerRemoteDataSource});
  @override
  Future<Either<Failure, RegisterResponseEntity>> register({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    // TODO: implement register
    return await registerRemoteDataSource.register(
      email: email,
      password: password,
      fullName: fullName,
      phone: phone,
    );
    // todo: handle the response from the remote data source and return the appropriate response
  }
}
