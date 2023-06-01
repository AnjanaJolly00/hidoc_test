import 'dart:convert';

import 'package:dio/dio.dart';

import 'models/apiresponse.dart';

class ApiService {
  final client = Dio();
  ApiResponse clientResponse = ApiResponse();

  Future<ApiResponse> getArticles({sId, userId}) async {
    try {
      Options options = Options();
      options.method = "GET";
      var response = await client.postUri(
        Uri.parse(
            "http://devapi.hidoc.co:8080/HidocWebApp/api/getArticlesByUid?"),
        data: jsonEncode(<String, String>{
          "sId": sId,
          "userId": userId,
        }).toString(),
      );
      print(response.data);
      print(response.data.runtimeType);

      clientResponse = ApiResponse.fromResponse(response);
      //
    } on DioError catch (e) {
      clientResponse = ApiResponse.fromResponse(e.response!);
    } catch (e) {
      clientResponse.errorMsg = e.toString();
    }
    return clientResponse;
  }
}
