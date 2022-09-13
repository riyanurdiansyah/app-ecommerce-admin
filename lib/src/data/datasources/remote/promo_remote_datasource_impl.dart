import 'dart:developer';

import 'package:app_ecommerce_admin/src/core/exception/exception.dart';
import 'package:app_ecommerce_admin/src/data/dto/promo_dto.dart';
import 'package:app_ecommerce_setup/utils/app_constanta.dart';
import 'package:dio/dio.dart';

import 'promo_remote_datasource.dart';

class PromoRemoteDataSourceImpl implements PromoRemoteDataSource {
  late Dio dio;
  PromoRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<PromoDTO> getAllPromo() async {
    final response = await dio.get(promoUrl);
    log("RESPONSE GET ALL PROMO : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code >= 500) {
      throw CustomException(code, 'Error... failed connect to server');
    } else if (code != 200) {
      throw CustomException(
          code, response.data['message'] ?? 'Failed... Please try again');
    } else {
      return PromoDTO.fromJson(response.data);
    }
  }
}
