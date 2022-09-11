class CategoryM {
  int? code;
  bool? status;
  String? message;
  int? page;
  int? total;
  int? lastPage;
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
    page = json['page'];
    total = json['total'];
    lastPage = json['last_page'];
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
  int? status;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
