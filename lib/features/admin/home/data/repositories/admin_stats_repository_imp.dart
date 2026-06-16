import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/home/domain/entities/admin_stats_entity.dart';
import 'package:main_tech/features/admin/home/domain/repositories/admin_stats_repository.dart';

import '../data_sources/admin_stats_remote_data_source.dart';

@Injectable(as: AdminStatsRepository)
class AdminStatsRepositoryImp implements AdminStatsRepository {
  final AdminStatsRemoteDataSource remoteDataSource;

  AdminStatsRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, AdminStatsResponseEntity>> getAdminStats() {
    return remoteDataSource.getAdminStats();
  }
}
