import 'dart:developer';

import 'package:linli/util/shared_preferences_util.dart';
import 'package:scoped_model/scoped_model.dart';

/// 用户的状态：
/// WAIT：未登录，并且未进入登录界面
/// LOGIN：用户正在登录界面
/// HOME：用户完成了登录，进入首页
enum UserLoginState { WAIT, LOGIN, HOME }

class GlobalModel extends Model {
  UserLoginState _userLoginState = UserLoginState.WAIT;

  GlobalModel() {
    judgeLogin();
  }

  UserLoginState get userLoginState => _userLoginState;

  void judgeLogin() {
    SharedPreferencesUtil.handleCache((prefs) {
      String id = prefs.getString("id") ?? "";
      String token = prefs.getString("token") ?? "";
      if (id == "" || token == "") {
        _userLoginState = UserLoginState.LOGIN;
      } else {
        _userLoginState = UserLoginState.HOME;
      }
      notifyListeners();
    });
  }
}