import 'package:app_ecommerce_admin/src/domain/entities/promo_data_entity.dart';

class PromoDataDTO extends PromoDataEntity {
  PromoDataDTO({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
    required super.kodepromo,
    required super.expired,
    required super.status,
    required super.created,
    required super.updated,
  });

  factory PromoDataDTO.fromJson(Map<String, dynamic> json) => PromoDataDTO(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        kodepromo: json['kode_promo'],
        expired: json['expired'],
        status: json['status'],
        created: json['created_at'],
        updated: json['updated_at'],
      );
}
