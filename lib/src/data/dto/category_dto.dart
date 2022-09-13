import 'package:app_ecommerce_admin/src/domain/entities/category_entity.dart';

import 'category_data_dto.dart';

class CategoryDTO extends CategoryEntity {
  const CategoryDTO({
    required int code,
    required bool status,
    required String message,
    required int page,
    required int total,
    required int lastPage,
    required List<CategoryDataDTO> data,
  }) : super(
          code: code,
          status: status,
          message: message,
          page: page,
          total: total,
          lastPage: lastPage,
          data: data,
        );

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
