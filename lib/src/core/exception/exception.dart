class CustomException implements Exception {
  int code;
  String message;
  CustomException(this.code, this.message);
}

// class ServerException implements Exception {
//   int code;
//   String message;
//   ServerException(this.code, this.message);
// }
