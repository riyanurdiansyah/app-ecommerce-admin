import 'package:app_ecommerce_admin/src/core/error/failures.dart';
import 'package:app_ecommerce_admin/src/domain/entities/promo_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PromoRepository {
  Future<Either<Failure, PromoEntity>> getAllPromo();
}
