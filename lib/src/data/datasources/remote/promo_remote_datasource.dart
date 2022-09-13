import 'package:app_ecommerce_admin/src/data/dto/promo_dto.dart';

abstract class PromoRemoteDataSource {
  Future<PromoDTO> getAllPromo();
}
