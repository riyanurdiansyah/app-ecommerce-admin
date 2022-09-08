import 'dart:developer';

import 'package:app_ecommerce_admin/models/category_m.dart';
import 'package:app_ecommerce_admin/services/category_service.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryRepository extends CategoryService {
  late Dio dio;
  CategoryRepository({Dio? dio}) {
    this.dio = dio ?? Dio();
  }
  @override
  Future<CategoryM> getAllCategory() async {
    try {
      final response = await dio.get(
        "http://0.0.0.0:8080/api/v1/categories",
        options: Options(
          validateStatus: (val) {
            return val! < 500;
          },
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
        ),
      );

      print("RESPONSE FETCH ALL CATEGORY : ${response.data}");
      return CategoryM();
      // if (response.statusCode == 200) {
      //   return CategoryM.fromJson(response.data);
      // } else if (response.statusCode == 401) {
      //   return CategoryM.withError(
      //     response.data['message'] ?? "Error... silahkan coba lagi",
      //     401,
      //   );
      // } else {
      //   return CategoryM.withError(
      //     response.data['message'] ?? "Error... silahkan coba lagi",
      //     response.statusCode ?? 500,
      //   );
      // }
    } catch (e) {
      log("ERROR FETCH CATEGORY : ${e.toString()}");
      Fluttertoast.showToast(msg: "ERROR : ${e.toString()}");
      return CategoryM.withError("Error : ${e.toString()}", 500);
    }
  }
}
