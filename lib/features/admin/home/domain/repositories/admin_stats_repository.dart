import 'package:dartz/dartz.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/home/domain/entities/admin_stats_entity.dart';

abstract class AdminStatsRepository {
  Future<Either<Failure, AdminStatsResponseEntity>> getAdminStats();
}
