import 'package:rewa/config/storage_manager.dart';
import 'package:rewa/data/model/register_entity.dart';
import 'package:rewa/data/repository/repository.dart';
import 'package:rewa/provider/view_state_model.dart';

class RegisterModel extends ViewStateModel {

  Future<bool> register(loginName, email, password) async {
    setBusy();
    try {
      var user = await Repository.register(loginName, email, password);
      StorageManager.sharedPreferences.setString(StorageManager.preToken, (user as RegisterEntity).jwt);
      setIdle();
      return true;
    } catch (e, s) {
      setError(e, s);
      return false;
    }
  }
}
