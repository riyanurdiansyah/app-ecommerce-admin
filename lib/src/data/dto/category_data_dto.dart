import 'package:app_ecommerce_admin/src/domain/entities/category_data_entity.dart';

class CategoryDataDTO extends CategoryDataEntity {
  CategoryDataDTO({
    required super.id,
    required super.name,
    required super.image,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
  });

  factory CategoryDataDTO.fromJson(Map<String, dynamic> json) =>
      CategoryDataDTO(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
