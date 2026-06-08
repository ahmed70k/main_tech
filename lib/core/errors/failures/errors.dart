abstract class Failure {
  final String message;
  Failure(this.message);
}

 class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class NetWorkError extends Failure {
  NetWorkError(super.message);
}
