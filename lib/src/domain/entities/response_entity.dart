class ResponseEntity {
  final int code;
  final bool status;
  final String message;

  ResponseEntity({
    required this.code,
    required this.status,
    required this.message,
  });

  factory ResponseEntity.fromJson(Map<String, dynamic> json) => ResponseEntity(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
