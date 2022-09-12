import 'dart:developer';
import 'dart:io';
import 'package:app_ecommerce_admin/src/data/dto/category_dto.dart';
import 'package:app_ecommerce_setup/app_ecommerce_setup.dart';
import 'package:dio/dio.dart';

abstract class CategoryRemoteDataSource {
  Future<CategoryDTO> getAllCategory();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  late Dio dio;
  CategoryRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<CategoryDTO> getAllCategory() async {
    final response = await dio.get(categoryUrl);
    log("RESPONSE GET ALL CATEGORY : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code >= 500) {
      throw const HttpException('Error... failed connect to server');
    } else {
      return CategoryDTO.fromJson(response.data);
    }
  }
}
