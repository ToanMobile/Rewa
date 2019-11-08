import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:rewa/common/constant.dart';

class Log {
  static var perform;
  static const tag = 'X-LOG';

  static init() {
    if (perform == null) {
      perform = const MethodChannel("x_log");
    }
  }

  static d(String msg, {tag: tag}) {
    if (!Constant.inProduction) {
      perform?.invokeMethod('logD', {'tag': tag, 'msg': msg});
      _print(msg, tag: tag);
    }
  }

  static w(String msg, {tag: tag}) {
    if (!Constant.inProduction) {
      perform?.invokeMethod('logW', {'tag': tag, 'msg': msg});
      _print(msg, tag: tag);
    }
  }

  static i(String msg, {tag: tag}) {
    if (!Constant.inProduction) {
      perform?.invokeMethod('logI', {'tag': tag, 'msg': msg});
      _print(msg, tag: tag);
    }
  }

  static e(String msg, {tag: tag}) {
    if (!Constant.inProduction) {
      perform?.invokeMethod('logE', {'tag': tag, 'msg': msg});
      _print(msg, tag: tag);
    }
  }

  static json(String msg, {tag: tag}) {
    if (!Constant.inProduction) {
      perform?.invokeMethod('logJson', {'tag': tag, 'msg': msg});
      _print(msg, tag: tag);
    }
  }

  static _print(String msg, {tag: tag}) {
    if (defaultTargetPlatform == TargetPlatform.iOS || perform == null && !Constant.inProduction) {
      _printLog('  v  ', msg);
    }
  }

  static void _printLog(String stag, Object object) {
    String da = object.toString();
    String _tag = (tag == null || tag.isEmpty) ? 'Log' : tag;
    while (da.isNotEmpty) {
      if (da.length > 512) {
        print("$_tag $stag ${da.substring(0, 512)}");
        da = da.substring(512, da.length);
      } else {
        print("$_tag $stag $da");
        da = "";
      }
    }
  }
}
