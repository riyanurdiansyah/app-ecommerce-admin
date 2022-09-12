import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}

class ServerFailure extends Failure {
  final String message;

  const ServerFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class HttpFailure extends Failure {
  final int code;
  final String message;

  const HttpFailure(
    this.code,
    this.message,
  );

  @override
  List<Object?> get props => [code, message];
}
