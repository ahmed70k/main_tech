import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/core/errors/failures/errors.dart';
import 'package:main_tech/features/admin/home/domain/entities/admin_stats_entity.dart';
import 'package:main_tech/features/admin/home/domain/repositories/admin_stats_repository.dart';

@injectable
class GetAdminStatsUseCase {
  final AdminStatsRepository repository;

  GetAdminStatsUseCase(this.repository);

  Future<Either<Failure, AdminStatsResponseEntity>> call() {
    return repository.getAdminStats();
  }
}
