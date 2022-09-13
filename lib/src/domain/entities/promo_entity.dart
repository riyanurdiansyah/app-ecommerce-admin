import 'package:app_ecommerce_admin/src/domain/entities/response_entity.dart';
import 'package:equatable/equatable.dart';

import 'promo_data_entity.dart';

class PromoEntity extends Equatable {
  final ResponseEntity response;
  final List<PromoDataEntity> data;

  const PromoEntity({
    required this.response,
    required this.data,
  });

  @override
  List<Object?> get props => [response, data];
}
