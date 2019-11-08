import 'package:rewa/data/model/login_entity.dart';
import 'package:rewa/data/model/register_entity.dart';
import 'package:rewa/data/service/api_service.dart';
import 'package:rewa/data/service/http_api_url.dart';

class Repository {
  static Future login(String username, String password) async {
    var response = await http.post<Map>(ApiUrl.login, data: {
      'identifier': username,
      'password': password,
    });
    return LoginEntity.fromJson(response.data);
  }

  static Future logout() async {
    var response = await http.post<Map>(ApiUrl.login);
    return LoginEntity.fromJson(response.data);
  }

  static Future register(String username, String email, String password) async {
    var response = await http.post<Map>(ApiUrl.register, data: {
      'username': username,
      'email'   : email,
      'password': password,
    });
    return RegisterEntity.fromJson(response.data);
  }

}
