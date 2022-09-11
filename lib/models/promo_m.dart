class PromoM {
  int? code;
  bool? status;
  String? message;
  List<Data>? data;
  String error = '';

  PromoM({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  PromoM.withError(String errorMessage, int errorCode) {
    error = errorMessage;
    code = errorCode;
  }

  PromoM.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? image;
  String? kodePromo;
  int? expired;
  int? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.kodePromo,
      this.expired,
      this.status,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    kodePromo = json['kode_promo'];
    expired = json['expired'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['kode_promo'] = kodePromo;
    data['expired'] = expired;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
