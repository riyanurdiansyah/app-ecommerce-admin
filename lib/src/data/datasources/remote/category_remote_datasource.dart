import 'package:app_ecommerce_admin/src/data/dto/category_dto.dart';

abstract class CategoryRemoteDataSource {
  Future<CategoryDTO> getAllCategory();
}
