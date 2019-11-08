import 'package:flutter/cupertino.dart';
import 'package:rewa/config/storage_manager.dart';
import 'package:rewa/data/model/login_entity.dart';

class UserModel extends ChangeNotifier {
  static const String kUser = 'PrefLogin';

  LoginEntity _loginEntity;

  LoginEntity get login => _loginEntity;

  bool get hasLogin => login != null;

  UserModel() {
    var userMap = StorageManager.localStorage.getItem(kUser);
    _loginEntity = userMap != null ? LoginEntity.fromJson(userMap) : null;
  }

  saveUser(LoginEntity loginEntity) {
    _loginEntity = loginEntity;
    notifyListeners();
    StorageManager.localStorage.setItem(kUser, loginEntity);
  }

  clearUser() {
    _loginEntity = null;
    notifyListeners();
    StorageManager.localStorage.deleteItem(kUser);
  }
}
