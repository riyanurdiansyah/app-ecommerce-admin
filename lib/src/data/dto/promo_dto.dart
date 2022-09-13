import 'package:app_ecommerce_admin/src/data/dto/promo_data_dto.dart';
import 'package:app_ecommerce_admin/src/domain/entities/promo_entity.dart';
import 'package:app_ecommerce_admin/src/domain/entities/response_entity.dart';

class PromoDTO extends PromoEntity {
  const PromoDTO({
    required ResponseEntity response,
    required List<PromoDataDTO> data,
  }) : super(
          response: response,
          data: data,
        );

  factory PromoDTO.fromJson(Map<String, dynamic> json) => PromoDTO(
        response: ResponseEntity.fromJson(json),
        data: List<PromoDataDTO>.from(
          json["data"].map(
            (e) => PromoDataDTO.fromJson(e),
          ),
        ),
      );
}
