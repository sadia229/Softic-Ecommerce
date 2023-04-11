class ApiResponse<T> {
  bool? status;
  String? message;
  T? user;
  String? token;

  ApiResponse({this.status, this.message, this.user, this.token});
}
