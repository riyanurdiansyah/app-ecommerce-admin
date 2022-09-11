import 'package:app_ecommerce_admin/app_ecommerce_admin.dart';

abstract class CategoryService {
  Future<CategoryM> getAllCategory(int page);
}
