import 'package:app_ecommerce_admin/src/domain/entities/category_data_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int code;
  final bool status;
  final String message;
  final int page;
  final int total;
  final int lastPage;
  final List<CategoryDataEntity> data;

  const CategoryEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.page,
    required this.total,
    required this.lastPage,
    required this.data,
  });

  @override
  List<Object?> get props => [
        code,
        status,
        message,
        page,
        total,
        lastPage,
        data,
      ];
}
