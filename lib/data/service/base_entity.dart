import 'package:rewa/entity_factory.dart';

class BaseEntity<T>{

  int code;
  String message;
  T data;
  List<T> listData = [];

  BaseEntity(this.code, this.message, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json.containsKey('data')){
      if (json['data'] is List) {
        (json['data'] as List).forEach((item){
          listData.add(EntityFactory.generateOBJ<T>(item));
        });
      }else {
        if (T.toString() == "String"){
          data = json['data'].toString() as T;
        }else if (T.toString() == "Map<dynamic, dynamic>"){
          data = json['data'] as T;
        }else {
          data = EntityFactory.generateOBJ(json['data']);
        }
      }
    }
  }
}
