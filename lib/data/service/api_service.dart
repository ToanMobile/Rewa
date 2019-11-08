import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rewa/utils/log_utils.dart';
import 'api.dart';
import 'http_api_url.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = ApiUrl.baseUrl;
    interceptors.add(ApiInterceptor());
  }
}

/// 玩Android API
class ApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    Log.e('---api-request--->url--> ${options.baseUrl}${options.path}' + ' queryParameters: ${options.queryParameters}');
    Log.e('---api-request--->data--->${options.data}');
    return options;
  }

  @override
  onResponse(Response response) {
    Log.e('---api-response--->resp----->${response.data}');
    if (response.statusCode == 200) {
      return http.resolve(response.data);
    } else {
      if (response.statusCode == -1001) {
        throw const UnAuthorizedException();
      } else {
        throw NotSuccessException.fromRespData(response.data);
      }
    }
  }
/*
  @override
  onResponse(Response response) {
    Log.json('---api-response--->resp----->${response.data}');
    ResponseData respData = ResponseData.fromJson(response.data);
    Log.e('>${respData.code.toString()}');
    Log.e('>${respData.success.toString()}');
    if (respData.success) {
      response.data = respData.data;
      return http.resolve(response);
    } else {
      if (respData.code == -1001) {
        throw const UnAuthorizedException();
      } else {
        throw NotSuccessException.fromRespData(respData);
      }
    }
  }*/
}

class ResponseData extends BaseResponseData {
  bool get success => 200 == code;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['error'];
    data = json['data'];
  }
}
