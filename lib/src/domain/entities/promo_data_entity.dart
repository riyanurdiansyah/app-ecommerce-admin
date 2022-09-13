class PromoDataEntity {
  final int id;
  final String name;
  final String description;
  final String image;
  final String kodepromo;
  final int expired;
  final int status;
  final String created;
  final String updated;

  PromoDataEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.kodepromo,
    required this.expired,
    required this.status,
    required this.created,
    required this.updated,
  });

  factory PromoDataEntity.fromJson(Map<String, dynamic> json) =>
      PromoDataEntity(
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "kode_promo": kodepromo,
        "expired": expired,
        "status": status,
        "created_at": created,
        "updated_at": updated,
      };
}
