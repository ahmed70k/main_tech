import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/home/data/models/admin_stats_dto.dart';

abstract class AdminStatsRemoteDataSource {
  Future<Either<Failure, AdminStatsResponseDto>> getAdminStats();
}
