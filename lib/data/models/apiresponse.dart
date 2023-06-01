import 'package:dio/dio.dart';

class ApiResponse<T> {
  /// true = request is success
  bool isSuccessful;
  int? code;

  /// response data for the request
  var rawResponse;

  /// Error message which can be displayed to user
  String? errorMsg;

  ApiResponse({
    this.isSuccessful = false,
    this.code = 400,
    this.rawResponse,
    this.errorMsg = "",
  });

  ApiResponse copyWith({
    bool? isSuccessful,
    int? code,
    String? rawResponse,
    String? errorMsg,
  }) {
    return ApiResponse(
      isSuccessful: isSuccessful ?? this.isSuccessful,
      code: code ?? this.code,
      rawResponse: rawResponse ?? this.rawResponse,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  factory ApiResponse.fromResponse(Response response) {
    return ApiResponse(
      isSuccessful: response.statusCode! >= 200 && response.statusCode! < 300,
      code: response.statusCode,
      rawResponse: response.data,
      errorMsg: response.statusMessage,
    );
  }
}
