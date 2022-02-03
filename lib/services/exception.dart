class AppException implements Exception {
  final String msg;

  AppException({this.msg = 'Somethings went wrong.'});
}
