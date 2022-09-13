import 'package:app_ecommerce_admin/src/core/exception/exception.dart';
import 'package:app_ecommerce_admin/src/data/datasources/remote/category_remote_datasource.dart';
import 'package:app_ecommerce_admin/src/domain/entities/category_entity.dart';
import 'package:app_ecommerce_admin/src/core/error/failures.dart';
import 'package:app_ecommerce_admin/src/domain/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryRepositoryImpl(this.categoryRemoteDataSource);

  @override
  Future<Either<Failure, CategoryEntity>> getAllCategory() async {
    try {
      final response = await categoryRemoteDataSource.getAllCategory();
      return Right(response);
    } catch (e) {
      if (e is CustomException) {
        return Left(HttpFailure(e.code, e.message));
      } else {
        return Left(HttpFailure(500, e.toString()));
      }
    }
  }
}
