import 'dart:developer';

import 'package:app_ecommerce_admin/app_constanta.dart';
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
        "http://10.0.2.2:8080/api/v1/categories",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSIsImVtYWlsIjoicml5YW5AZ21haWwuY29tIiwiZXhwIjoxNjYyNTg1ODA4LCJpYXQiOjE2NjI1ODQwMDgsImlzcyI6InJzeWFocHJvamVjdC5jby5pZCJ9.iIKu1UX4ku_NOJbPUqLn4eG4OYKafd9tP2q5BigikII",
          },
        ),
      );

      log("RESPONSE FETCH ALL CATEGORY : ${response.data}");
      if (response.statusCode == 200) {
        return CategoryM.fromJson(response.data);
      } else if (response.statusCode == 401) {
        return CategoryM.withError(
          response.data['message'] ?? "Error... silahkan coba lagi",
          401,
        );
      } else {
        return CategoryM.withError(
          response.data['message'] ?? "Error... silahkan coba lagi",
          response.statusCode ?? 500,
        );
      }
    } catch (e) {
      log("ERROR FETCH CATEGORY : ${e.toString()}");
      Fluttertoast.showToast(msg: "ERROR : ${e.toString()}");
      return CategoryM.withError("Error : ${e.toString()}", 500);
    }
  }
}
