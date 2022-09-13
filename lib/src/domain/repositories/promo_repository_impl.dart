import 'package:app_ecommerce_admin/src/core/exception/exception.dart';
import 'package:app_ecommerce_admin/src/data/datasources/remote/promo_remote_datasource.dart';
import 'package:app_ecommerce_admin/src/domain/entities/promo_entity.dart';
import 'package:app_ecommerce_admin/src/core/error/failures.dart';
import 'package:app_ecommerce_admin/src/domain/repositories/promo_repository.dart';
import 'package:dartz/dartz.dart';

class PromoRepositoryImpl implements PromoRepository {
  final PromoRemoteDataSource dataSource;

  PromoRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, PromoEntity>> getAllPromo() async {
    try {
      final promo = await dataSource.getAllPromo();
      return Right(promo);
    } catch (e) {
      if (e is CustomException) {
        return Left(HttpFailure(e.code, e.message));
      } else {
        return Left(HttpFailure(500, e.toString()));
      }
    }
  }
}
