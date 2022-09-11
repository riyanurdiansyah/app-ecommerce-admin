import 'dart:developer';

import 'package:app_ecommerce_admin/models/promo_m.dart';
import 'package:app_ecommerce_admin/repositories/promo_repository.dart';
import 'package:app_ecommerce_setup/utils/app_constanta.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PromoRepositoryImpl extends PromoRepository {
  late Dio dio;
  PromoRepositoryImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<PromoM> getAllPromo() async {
    try {
      final response = await dio.get(
        promoUrl,
      );
      log("RESPONSE GET ALL PROMO : ${response.data}");
      if (response.statusCode == 200) {
        return PromoM.fromJson(response.data);
      } else {
        return PromoM.withError(
          response.data['message'] ?? "Error... silahkan coba lagi",
          response.statusCode ?? 500,
        );
      }
    } catch (e) {
      log("ERROR GET ALL CATEGORY : ${e.toString()}");
      Fluttertoast.showToast(msg: "ERROR : ${e.toString()}");
      return PromoM.withError("Error : ${e.toString()}", 500);
    }
  }
}
