import 'package:app_ecommerce_admin/src/core/error/failures.dart';
import 'package:app_ecommerce_admin/src/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoryEntity>> getAllCategory();
}
