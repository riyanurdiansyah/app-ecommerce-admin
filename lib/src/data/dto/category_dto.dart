import 'package:app_ecommerce_admin/src/domain/entities/category_entity.dart';

import 'category_data_dto.dart';

class CategoryDTO extends CategoryEntity {
  const CategoryDTO(
      {required super.code,
      required super.status,
      required super.message,
      required super.page,
      required super.total,
      required super.lastPage,
      required super.data});

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => CategoryDTO(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: List<CategoryDataDTO>.from(
            json["data"].map((e) => CategoryDataDTO.fromJson(e))),
        page: json["page"],
        total: json["total"],
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data,
        "page": page,
        "total": total,
        "last_page": lastPage,
      };
}
