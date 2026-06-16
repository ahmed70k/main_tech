import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/api/api_manager/api_manager.dart';
import 'package:main_tech/core/api/endpoints/endpoints.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/home/data/models/admin_stats_dto.dart';

import 'admin_stats_remote_data_source.dart';

@Injectable(as: AdminStatsRemoteDataSource)
class AdminStatsRemoteDataSourceImp implements AdminStatsRemoteDataSource {
  final ApiManager apiManager;

  AdminStatsRemoteDataSourceImp(this.apiManager);

  @override
  Future<Either<Failure, AdminStatsResponseDto>> getAdminStats() async {
    try {
      final response = await apiManager.getData(
        endpoint: Endpoints.adminStats,
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        final Map<String, dynamic> dataMap = Map<String, dynamic>.from(response.data);

        // Fetch actual users count from the users list to sync with deleted users
        try {
          final usersResponse = await apiManager.getData(
            endpoint: Endpoints.adminUsers,
            headers: {'Accept': 'application/json'},
          );
          if (usersResponse.statusCode != null &&
              usersResponse.statusCode! >= 200 &&
              usersResponse.statusCode! < 300) {
            final totalUsers = usersResponse.data?['data']?['total'] as int?;
            if (totalUsers != null && dataMap['data'] != null) {
              final nestedData = Map<String, dynamic>.from(dataMap['data']);
              nestedData['users'] = totalUsers;
              dataMap['data'] = nestedData;
            }
          }
        } catch (_) {
          // Fallback to default stats count if call fails
        }

        return Right(AdminStatsResponseDto.fromJson(dataMap));
      }

      return Left(
        ServerFailure(
          response.data?['message'] ??
              response.statusMessage ??
              'Server Failure',
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
