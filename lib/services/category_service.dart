import 'package:app_ecommerce_admin/app_ecommerce_admin.dart';
import 'package:dio/dio.dart';

abstract class CategoryService {
  Future<CategoryM> getAllCategory();
}
