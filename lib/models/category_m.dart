class CategoryM {
  int? code;
  bool? status;
  String? message;
  List<Data>? data;
  String error = '';

  CategoryM({this.code, this.status, this.message, this.data});

  CategoryM.withError(String errorMessage, int errorCode) {
    error = errorMessage;
    code = errorCode;
  }

  CategoryM.fromJson(Map<String, dynamic> json) {
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
}

class Data {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
