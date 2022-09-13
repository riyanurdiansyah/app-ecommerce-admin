import 'package:app_ecommerce_admin/src/core/error/failures.dart';
import 'package:app_ecommerce_admin/src/domain/entities/category_entity.dart';
import 'package:app_ecommerce_admin/src/domain/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryUseCase {
  final CategoryRepository repository;

  CategoryUseCase(this.repository);

  Future<Either<Failure, CategoryEntity>> execute() async =>
      await repository.getAllCategory();
}
