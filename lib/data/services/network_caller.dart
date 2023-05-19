import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../models/response_model.dart';
import '../utils/urls.dart';

class NetworkCaller {
  NetworkCaller._();

  static Future<ResponseModel> getRequest({required String url}) async {
    try {
      final Response response = await get(Uri.parse(Urls.baseUrl + url));
      if (response.statusCode == 200) {
        return ResponseModel(
            isSuccess: true,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body),
        );
      } else {
        return ResponseModel(
          isSuccess: false,
          statusCode: response.statusCode,
          returnData: jsonDecode(response.body),
        );
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
        isSuccess: false,
        statusCode: -1,
        returnData: e.toString(),
      );
    }
  }
}
