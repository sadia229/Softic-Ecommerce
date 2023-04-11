import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String? message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          message = "No Internet connection 😑";
        } else if (dioError.message.contains('HttpException')) {
          message = "Couldn't find the post 😱 😑";
        } else if (dioError.message.contains('FormatException')) {
          message = "Bad response format 👎";
        } else {
          message = dioError.message;
        }
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;

      case DioErrorType.response:
        message = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int statusCode, dynamic error) {
    final String errorMessage = error["message"];
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return errorMessage;
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message!;
}
