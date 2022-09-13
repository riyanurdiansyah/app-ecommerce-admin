import 'package:app_ecommerce_admin/src/core/error/failures.dart';
import 'package:app_ecommerce_admin/src/domain/entities/promo_entity.dart';
import 'package:app_ecommerce_admin/src/domain/repositories/promo_repository.dart';
import 'package:dartz/dartz.dart';

class PromoUseCase {
  final PromoRepository repository;

  PromoUseCase(this.repository);

  Future<Either<Failure, PromoEntity>> getAllPromo() async =>
      await repository.getAllPromo();
}
