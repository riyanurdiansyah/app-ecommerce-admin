import 'dart:developer';

import 'package:app_ecommerce_admin/models/category_m.dart';
import 'package:app_ecommerce_admin/services/category_service.dart';
import 'package:app_ecommerce_setup/utils/app_constanta.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryRepository extends CategoryService {
  late Dio dio;
  CategoryRepository({Dio? dio}) {
    this.dio = dio ?? Dio();
  }
  @override
  Future<CategoryM> getAllCategory(int? page) async {
    try {
      final response = await dio.get(
        "$categoryUrl?page=$page",
      );
      log("RESPONSE GET ALL CATEGORY : ${response.data}");
      if (response.statusCode == 200) {
        return CategoryM.fromJson(response.data);
      } else {
        return CategoryM.withError(
          response.data['message'] ?? "Error... silahkan coba lagi",
          response.statusCode ?? 500,
        );
      }
    } catch (e) {
      log("ERROR GET ALL CATEGORY : ${e.toString()}");
      Fluttertoast.showToast(msg: "ERROR : ${e.toString()}");
      return CategoryM.withError("Error : ${e.toString()}", 500);
    }
  }
}
