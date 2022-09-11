import 'package:app_ecommerce_admin/models/promo_m.dart';

abstract class PromoRepository {
  Future<PromoM> getAllPromo();
}
