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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/api/api_manager/api_manager.dart' as _i998;
import '../core/local_storage/auth_token_storage.dart' as _i784;
import '../core/utils/diooooooo.dart' as _i208;
import '../features/admin/home/data/data_sources/admin_stats_remote_data_source.dart'
    as _i893;
import '../features/admin/home/data/data_sources/admin_stats_remote_data_source_imp.dart'
    as _i554;
import '../features/admin/home/data/repositories/admin_stats_repository_imp.dart'
    as _i380;
import '../features/admin/home/domain/repositories/admin_stats_repository.dart'
    as _i185;
import '../features/admin/home/domain/use_cases/get_admin_stats_use_case.dart'
    as _i769;
import '../features/admin/home/presentation/manager/admin_stats_cubit.dart'
    as _i102;
import '../features/admin/presentation/manager/admin_layout_cubit.dart'
    as _i137;
import '../features/admin/subscriptions/data/data_sources/subscriptions_remote_data_source.dart'
    as _i871;
import '../features/admin/subscriptions/data/data_sources/subscriptions_remote_data_source_imp.dart'
    as _i867;
import '../features/admin/subscriptions/data/repositories/subscriptions_repository_imp.dart'
    as _i644;
import '../features/admin/subscriptions/domain/repositories/subscriptions_repository.dart'
    as _i472;
import '../features/admin/subscriptions/domain/use_cases/assign_subscription_use_case.dart'
    as _i748;
import '../features/admin/subscriptions/domain/use_cases/delete_id_subscription_use_case.dart'
    as _i614;
import '../features/admin/subscriptions/domain/use_cases/get_id_subscription_use_case.dart'
    as _i365;
import '../features/admin/subscriptions/domain/use_cases/get_subscriptions_use_case.dart'
    as _i842;
import '../features/admin/subscriptions/domain/use_cases/update_id_subscription_use_case.dart'
    as _i871;
import '../features/admin/subscriptions/presentation/manager/subscriptions_cubit.dart'
    as _i997;
import '../features/admin/subscriptions_plans/data/data_sources/subscription_plans_remote_data_source.dart'
    as _i668;
import '../features/admin/subscriptions_plans/data/data_sources/subscription_plans_remote_data_source_imp.dart'
    as _i977;
import '../features/admin/subscriptions_plans/data/repositories/subscription_plans_repository_imp.dart'
    as _i118;
import '../features/admin/subscriptions_plans/domain/repositories/subscription_plans_repository.dart'
    as _i631;
import '../features/admin/subscriptions_plans/domain/use_cases/create_subscription_plan_use_case.dart'
    as _i561;
import '../features/admin/subscriptions_plans/domain/use_cases/delete_id_subscription_plan_use_case.dart'
    as _i21;
import '../features/admin/subscriptions_plans/domain/use_cases/get_id_subscription_plan_use_case.dart'
    as _i858;
import '../features/admin/subscriptions_plans/domain/use_cases/get_subscription_plans_use_case.dart'
    as _i931;
import '../features/admin/subscriptions_plans/domain/use_cases/update_id_subscription_plan_use_case.dart'
    as _i665;
import '../features/admin/subscriptions_plans/presentation/manager/subscription_plans_cubit.dart'
    as _i765;
import '../features/admin/users/data/data_sources/users_remote_data_source.dart'
    as _i937;
import '../features/admin/users/data/data_sources/users_remote_data_source_imp.dart'
    as _i655;
import '../features/admin/users/data/repositories/users_repository_imp.dart'
    as _i487;
import '../features/admin/users/domain/repositories/users_repository.dart'
    as _i995;
import '../features/admin/users/domain/use_cases/delete_user_use_case.dart'
    as _i163;
import '../features/admin/users/domain/use_cases/get_user_by_id_use_case.dart'
    as _i325;
import '../features/admin/users/domain/use_cases/get_users_use_case.dart'
    as _i424;
import '../features/admin/users/presentation/manager/users_cubit.dart' as _i203;
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
import '../features/dashboard_users/presentation/manager/user_layout_cubit.dart'
    as _i174;
import '../features/notifications/data/data_sources/notifications_remote_data_source.dart'
    as _i450;
import '../features/notifications/data/data_sources/notifications_remote_data_source_imp.dart'
    as _i304;
import '../features/notifications/data/repositories/notifications_repository_imp.dart'
    as _i149;
import '../features/notifications/domain/repositories/notifications_repository.dart'
    as _i480;
import '../features/notifications/domain/use_cases/delete_notification_use_case.dart'
    as _i83;
import '../features/notifications/domain/use_cases/get_notifications_use_case.dart'
    as _i576;
import '../features/notifications/domain/use_cases/get_unread_notifications_count_use_case.dart'
    as _i331;
import '../features/notifications/domain/use_cases/get_unread_notifications_use_case.dart'
    as _i882;
import '../features/notifications/domain/use_cases/mark_all_notifications_as_read_use_case.dart'
    as _i155;
import '../features/notifications/domain/use_cases/mark_notification_as_read_use_case.dart'
    as _i477;
import '../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i389;
import '../features/profile/data/data_sources/profile_remote_data_source.dart'
    as _i399;
import '../features/profile/data/data_sources/profile_remote_data_source_imp.dart'
    as _i313;
import '../features/profile/data/repositories/profile_repository_imp.dart'
    as _i879;
import '../features/profile/domain/repositories/profile_repository.dart'
    as _i386;
import '../features/profile/domain/use_cases/get_profile_use_case.dart'
    as _i483;
import '../features/profile/domain/use_cases/update_profile_use_case.dart'
    as _i336;
import '../features/profile/presentation/manager/profile_cubit.dart' as _i519;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i137.AdminLayoutCubit>(() => _i137.AdminLayoutCubit());
    gh.factory<_i174.UserLayoutCubit>(() => _i174.UserLayoutCubit());
    gh.lazySingleton<_i784.AuthTokenStorage>(
      () => _i784.AuthTokenStorage(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<_i784.AuthTokenStorage>()),
    );
    gh.singleton<_i998.ApiManager>(() => _i998.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i399.ProfileRemoteDataSource>(
      () => _i313.ProfileRemoteDataSourceImp(gh<_i998.ApiManager>()),
    );
    gh.factory<_i937.UsersRemoteDataSource>(
      () => _i655.UsersRemoteDataSourceImp(gh<_i998.ApiManager>()),
    );
    gh.factory<_i1041.RegisterRemoteDataSourceInterface>(
      () =>
          _i678.RegisterRemoteDataSourceImp(apiManager: gh<_i998.ApiManager>()),
    );
    gh.factory<_i680.ResetPasswordRemoteDataSource>(
      () => _i672.ResetPasswordRemoteDataSourceImp(gh<_i998.ApiManager>()),
    );
    gh.factory<_i893.AdminStatsRemoteDataSource>(
      () => _i554.AdminStatsRemoteDataSourceImp(gh<_i998.ApiManager>()),
    );
    gh.factory<_i668.SubscriptionPlansRemoteDataSource>(
      () => _i977.SubscriptionPlansRemoteDataSourceImp(gh<_i998.ApiManager>()),
    );
    gh.factory<_i185.AdminStatsRepository>(
      () =>
          _i380.AdminStatsRepositoryImp(gh<_i893.AdminStatsRemoteDataSource>()),
    );
    gh.factory<_i1034.SendOtpRemoteDataSource>(
      () => _i90.SendOtpRemoteDataSourceImp(gh<_i998.ApiManager>()),
    );
    gh.factory<_i631.SubscriptionPlansRepository>(
      () => _i118.SubscriptionPlansRepositoryImp(
        gh<_i668.SubscriptionPlansRemoteDataSource>(),
      ),
    );
    gh.factory<_i769.GetAdminStatsUseCase>(
      () => _i769.GetAdminStatsUseCase(gh<_i185.AdminStatsRepository>()),
    );
    gh.factory<_i995.UsersRepository>(
      () => _i487.UsersRepositoryImp(gh<_i937.UsersRemoteDataSource>()),
    );
    gh.factory<_i561.CreateSubscriptionPlanUseCase>(
      () => _i561.CreateSubscriptionPlanUseCase(
        gh<_i631.SubscriptionPlansRepository>(),
      ),
    );
    gh.factory<_i21.DeleteIdSubscriptionPlanUseCase>(
      () => _i21.DeleteIdSubscriptionPlanUseCase(
        gh<_i631.SubscriptionPlansRepository>(),
      ),
    );
    gh.factory<_i858.GetIdSubscriptionPlanUseCase>(
      () => _i858.GetIdSubscriptionPlanUseCase(
        gh<_i631.SubscriptionPlansRepository>(),
      ),
    );
    gh.factory<_i931.GetSubscriptionPlansUseCase>(
      () => _i931.GetSubscriptionPlansUseCase(
        gh<_i631.SubscriptionPlansRepository>(),
      ),
    );
    gh.factory<_i665.UpdateIdSubscriptionPlanUseCase>(
      () => _i665.UpdateIdSubscriptionPlanUseCase(
        gh<_i631.SubscriptionPlansRepository>(),
      ),
    );
    gh.factory<_i40.LoginRemoteDataSourceInterface>(
      () => _i129.LoginRemoteDataSourceImp(apiManager: gh<_i998.ApiManager>()),
    );
    gh.factory<_i386.ProfileRepository>(
      () => _i879.ProfileRepositoryImp(gh<_i399.ProfileRemoteDataSource>()),
    );
    gh.factory<_i722.LogoutRemoteDataSource>(
      () => _i506.LogoutRemoteDataSourceImp(gh<_i998.ApiManager>()),
    );
    gh.factory<_i450.NotificationsRemoteDataSource>(
      () => _i304.NotificationsRemoteDataSourceImp(gh<_i998.ApiManager>()),
    );
    gh.factory<_i1009.RefreshTokenRemoteDataSource>(
      () => _i619.RefreshTokenRemoteDataSourceImp(gh<_i998.ApiManager>()),
    );
    gh.factory<_i871.SubscriptionsRemoteDataSource>(
      () => _i867.SubscriptionsRemoteDataSourceImp(gh<_i998.ApiManager>()),
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
    gh.factory<_i163.DeleteUserUseCase>(
      () => _i163.DeleteUserUseCase(gh<_i995.UsersRepository>()),
    );
    gh.factory<_i325.GetUserByIdUseCase>(
      () => _i325.GetUserByIdUseCase(gh<_i995.UsersRepository>()),
    );
    gh.factory<_i424.GetUsersUseCase>(
      () => _i424.GetUsersUseCase(gh<_i995.UsersRepository>()),
    );
    gh.factory<_i472.SubscriptionsRepository>(
      () => _i644.SubscriptionsRepositoryImp(
        gh<_i871.SubscriptionsRemoteDataSource>(),
      ),
    );
    gh.factory<_i765.SubscriptionPlansCubit>(
      () => _i765.SubscriptionPlansCubit(
        gh<_i931.GetSubscriptionPlansUseCase>(),
        gh<_i858.GetIdSubscriptionPlanUseCase>(),
        gh<_i665.UpdateIdSubscriptionPlanUseCase>(),
        gh<_i561.CreateSubscriptionPlanUseCase>(),
        gh<_i21.DeleteIdSubscriptionPlanUseCase>(),
      ),
    );
    gh.factory<_i671.LoginRepository>(
      () => _i401.LoginRepositoryImp(
        loginRemoteDataSource: gh<_i40.LoginRemoteDataSourceInterface>(),
      ),
    );
    gh.factory<_i748.AssignSubscriptionUseCase>(
      () =>
          _i748.AssignSubscriptionUseCase(gh<_i472.SubscriptionsRepository>()),
    );
    gh.factory<_i614.DeleteIdSubscriptionUseCase>(
      () => _i614.DeleteIdSubscriptionUseCase(
        gh<_i472.SubscriptionsRepository>(),
      ),
    );
    gh.factory<_i365.GetIdSubscriptionUseCase>(
      () => _i365.GetIdSubscriptionUseCase(gh<_i472.SubscriptionsRepository>()),
    );
    gh.factory<_i842.GetSubscriptionsUseCase>(
      () => _i842.GetSubscriptionsUseCase(gh<_i472.SubscriptionsRepository>()),
    );
    gh.factory<_i871.UpdateIdSubscriptionUseCase>(
      () => _i871.UpdateIdSubscriptionUseCase(
        gh<_i472.SubscriptionsRepository>(),
      ),
    );
    gh.factory<_i102.AdminStatsCubit>(
      () => _i102.AdminStatsCubit(gh<_i769.GetAdminStatsUseCase>()),
    );
    gh.factory<_i480.NotificationsRepository>(
      () => _i149.NotificationsRepositoryImp(
        gh<_i450.NotificationsRemoteDataSource>(),
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
    gh.factory<_i997.SubscriptionsCubit>(
      () => _i997.SubscriptionsCubit(
        gh<_i842.GetSubscriptionsUseCase>(),
        gh<_i365.GetIdSubscriptionUseCase>(),
        gh<_i871.UpdateIdSubscriptionUseCase>(),
        gh<_i614.DeleteIdSubscriptionUseCase>(),
        gh<_i748.AssignSubscriptionUseCase>(),
      ),
    );
    gh.factory<_i203.UsersCubit>(
      () => _i203.UsersCubit(
        gh<_i424.GetUsersUseCase>(),
        gh<_i163.DeleteUserUseCase>(),
        gh<_i325.GetUserByIdUseCase>(),
      ),
    );
    gh.factory<_i483.GetProfileUseCase>(
      () => _i483.GetProfileUseCase(gh<_i386.ProfileRepository>()),
    );
    gh.factory<_i336.UpdateProfileUseCase>(
      () => _i336.UpdateProfileUseCase(gh<_i386.ProfileRepository>()),
    );
    gh.factory<_i519.ProfileCubit>(
      () => _i519.ProfileCubit(
        gh<_i483.GetProfileUseCase>(),
        gh<_i336.UpdateProfileUseCase>(),
      ),
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
    gh.factory<_i141.LoginViewModel>(
      () => _i141.LoginViewModel(
        gh<_i424.LoginUseCase>(),
        gh<_i784.AuthTokenStorage>(),
      ),
    );
    gh.factory<_i852.RegisterUseCase>(
      () => _i852.RegisterUseCase(
        registerRepository: gh<_i369.RegisterRepository>(),
      ),
    );
    gh.factory<_i83.DeleteNotificationUseCase>(
      () => _i83.DeleteNotificationUseCase(gh<_i480.NotificationsRepository>()),
    );
    gh.factory<_i576.GetNotificationsUseCase>(
      () => _i576.GetNotificationsUseCase(gh<_i480.NotificationsRepository>()),
    );
    gh.factory<_i331.GetUnreadNotificationsCountUseCase>(
      () => _i331.GetUnreadNotificationsCountUseCase(
        gh<_i480.NotificationsRepository>(),
      ),
    );
    gh.factory<_i882.GetUnreadNotificationsUseCase>(
      () => _i882.GetUnreadNotificationsUseCase(
        gh<_i480.NotificationsRepository>(),
      ),
    );
    gh.factory<_i155.MarkAllNotificationsAsReadUseCase>(
      () => _i155.MarkAllNotificationsAsReadUseCase(
        gh<_i480.NotificationsRepository>(),
      ),
    );
    gh.factory<_i477.MarkNotificationAsReadUseCase>(
      () => _i477.MarkNotificationAsReadUseCase(
        gh<_i480.NotificationsRepository>(),
      ),
    );
    gh.factory<_i161.SendOtpCubit>(
      () => _i161.SendOtpCubit(gh<_i779.SendOtpUseCase>()),
    );
    gh.factory<_i839.RegisterViewModel>(
      () => _i839.RegisterViewModel(gh<_i852.RegisterUseCase>()),
    );
    gh.factory<_i958.LogoutCubit>(
      () => _i958.LogoutCubit(
        gh<_i568.LogoutUseCase>(),
        gh<_i784.AuthTokenStorage>(),
      ),
    );
    gh.factory<_i494.ResetPasswordCubit>(
      () => _i494.ResetPasswordCubit(gh<_i267.ResetPasswordUseCase>()),
    );
    gh.factory<_i650.RefreshTokenUseCase>(
      () => _i650.RefreshTokenUseCase(gh<_i392.RefreshTokenRepository>()),
    );
    gh.factory<_i389.NotificationsCubit>(
      () => _i389.NotificationsCubit(
        gh<_i576.GetNotificationsUseCase>(),
        gh<_i882.GetUnreadNotificationsUseCase>(),
        gh<_i331.GetUnreadNotificationsCountUseCase>(),
        gh<_i477.MarkNotificationAsReadUseCase>(),
        gh<_i155.MarkAllNotificationsAsReadUseCase>(),
        gh<_i83.DeleteNotificationUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i208.RegisterModule {}
