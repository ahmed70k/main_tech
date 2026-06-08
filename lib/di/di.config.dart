// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager/api_manager.dart' as _i998;
import '../core/utils/diooooooo.dart' as _i208;
import '../features/auth/login/data/data_sources/login_remote_data_source_imp.dart'
    as _i129;
import '../features/auth/login/data/repositories/login_repository_imp.dart'
    as _i401;
import '../features/auth/login/domain/repositories/login_remote_data_source.dart'
    as _i40;
import '../features/auth/login/domain/repositories/login_repository.dart'
    as _i671;
import '../features/auth/login/domain/use_cases/login_use_case.dart' as _i424;
import '../features/auth/login/presentation/manager/login_cubit.dart' as _i141;
import '../features/auth/logout/data/data_sources/logout_remote_data_source.dart'
    as _i722;
import '../features/auth/logout/data/data_sources/logout_remote_data_source_imp.dart'
    as _i506;
import '../features/auth/logout/data/repositories/logout_repository_imp.dart'
    as _i988;
import '../features/auth/logout/domain/repositories/logout_repository.dart'
    as _i158;
import '../features/auth/logout/domain/use_cases/logout_use_case.dart' as _i568;
import '../features/auth/logout/presentation/manager/logout_cubit.dart'
    as _i958;
import '../features/auth/refresh_token/data/data_sources/refresh_token_remote_data_source.dart'
    as _i1009;
import '../features/auth/refresh_token/data/data_sources/refresh_token_remote_data_source_imp.dart'
    as _i619;
import '../features/auth/refresh_token/data/repositories/refresh_token_repository_imp.dart'
    as _i165;
import '../features/auth/refresh_token/domain/repositories/refresh_token_repository.dart'
    as _i392;
import '../features/auth/refresh_token/domain/use_cases/refresh_token_use_case.dart'
    as _i650;
import '../features/auth/register/data/data_sources/register_remote_data_source_imp.dart'
    as _i678;
import '../features/auth/register/data/repositories/register_repository_imp.dart'
    as _i222;
import '../features/auth/register/domain/repositories/register_remote_data_source.dart'
    as _i1041;
import '../features/auth/register/domain/repositories/register_repository.dart'
    as _i369;
import '../features/auth/register/domain/use_cases/register_use_case.dart'
    as _i852;
import '../features/auth/register/presentation/manager/register_cubit.dart'
    as _i839;
import '../features/auth/reset_password/data/data_sources/reset_password_remote_data_source.dart'
    as _i680;
import '../features/auth/reset_password/data/data_sources/reset_password_remote_data_source_imp.dart'
    as _i672;
import '../features/auth/reset_password/data/repositories/reset_password_repository_imp.dart'
    as _i295;
import '../features/auth/reset_password/domain/repositories/reset_password_repository.dart'
    as _i228;
import '../features/auth/reset_password/domain/use_cases/reset_password_use_case.dart'
    as _i267;
import '../features/auth/reset_password/presentation/manager/reset_password_cubit.dart'
    as _i494;
import '../features/auth/send_otp/data/data_sources/send_otp_remote_data_source.dart'
    as _i1034;
import '../features/auth/send_otp/data/data_sources/send_otp_remote_data_source_imp.dart'
    as _i90;
import '../features/auth/send_otp/data/repositories/send_otp_repository_imp.dart'
    as _i989;
import '../features/auth/send_otp/domain/repositories/send_otp_repository.dart'
    as _i893;
import '../features/auth/send_otp/domain/use_cases/send_otp_use_case.dart'
    as _i779;
import '../features/auth/send_otp/presentation/manager/send_otp_cubit.dart'
    as _i161;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i998.ApiManager>(() => _i998.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i1041.RegisterRemoteDataSourceInterface>(
      () =>
          _i678.RegisterRemoteDataSourceImp(apiManager: gh<_i998.ApiManager>()),
    );
    gh.factory<_i680.ResetPasswordRemoteDataSource>(
      () => _i672.ResetPasswordRemoteDataSourceImp(gh<_i998.ApiManager>()),
    );
    gh.factory<_i1034.SendOtpRemoteDataSource>(
      () => _i90.SendOtpRemoteDataSourceImp(gh<_i998.ApiManager>()),
    );
    gh.factory<_i40.LoginRemoteDataSourceInterface>(
      () => _i129.LoginRemoteDataSourceImp(apiManager: gh<_i998.ApiManager>()),
    );
    gh.factory<_i722.LogoutRemoteDataSource>(
      () => _i506.LogoutRemoteDataSourceImp(gh<_i998.ApiManager>()),
    );
    gh.factory<_i1009.RefreshTokenRemoteDataSource>(
      () => _i619.RefreshTokenRemoteDataSourceImp(gh<_i998.ApiManager>()),
    );
    gh.factory<_i369.RegisterRepository>(
      () => _i222.RegisterRepositoryImp(
        registerRemoteDataSource:
            gh<_i1041.RegisterRemoteDataSourceInterface>(),
      ),
    );
    gh.factory<_i228.ResetPasswordRepository>(
      () => _i295.ResetPasswordRepositoryImp(
        gh<_i680.ResetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i893.SendOtpRepository>(
      () => _i989.SendOtpRepositoryImp(gh<_i1034.SendOtpRemoteDataSource>()),
    );
    gh.factory<_i671.LoginRepository>(
      () => _i401.LoginRepositoryImp(
        loginRemoteDataSource: gh<_i40.LoginRemoteDataSourceInterface>(),
      ),
    );
    gh.factory<_i779.SendOtpUseCase>(
      () => _i779.SendOtpUseCase(gh<_i893.SendOtpRepository>()),
    );
    gh.factory<_i158.LogoutRepository>(
      () => _i988.LogoutRepositoryImp(gh<_i722.LogoutRemoteDataSource>()),
    );
    gh.factory<_i424.LoginUseCase>(
      () => _i424.LoginUseCase(loginRepository: gh<_i671.LoginRepository>()),
    );
    gh.factory<_i267.ResetPasswordUseCase>(
      () => _i267.ResetPasswordUseCase(gh<_i228.ResetPasswordRepository>()),
    );
    gh.factory<_i392.RefreshTokenRepository>(
      () => _i165.RefreshTokenRepositoryImp(
        gh<_i1009.RefreshTokenRemoteDataSource>(),
      ),
    );
    gh.factory<_i568.LogoutUseCase>(
      () => _i568.LogoutUseCase(gh<_i158.LogoutRepository>()),
    );
    gh.factory<_i852.RegisterUseCase>(
      () => _i852.RegisterUseCase(
        registerRepository: gh<_i369.RegisterRepository>(),
      ),
    );
    gh.factory<_i141.LoginViewModel>(
      () => _i141.LoginViewModel(gh<_i424.LoginUseCase>()),
    );
    gh.factory<_i161.SendOtpCubit>(
      () => _i161.SendOtpCubit(gh<_i779.SendOtpUseCase>()),
    );
    gh.factory<_i839.RegisterViewModel>(
      () => _i839.RegisterViewModel(gh<_i852.RegisterUseCase>()),
    );
    gh.factory<_i958.LogoutCubit>(
      () => _i958.LogoutCubit(gh<_i568.LogoutUseCase>()),
    );
    gh.factory<_i494.ResetPasswordCubit>(
      () => _i494.ResetPasswordCubit(gh<_i267.ResetPasswordUseCase>()),
    );
    gh.factory<_i650.RefreshTokenUseCase>(
      () => _i650.RefreshTokenUseCase(gh<_i392.RefreshTokenRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i208.RegisterModule {}
