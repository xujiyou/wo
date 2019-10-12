import 'dart:developer';

import 'package:linli/util/shared_preferences_util.dart';
import 'package:scoped_model/scoped_model.dart';

/// 用户的状态：
/// WAIT：未登录，并且未进入登录界面
/// NON_AUTH：用户还未进行认证，进入游客界面
/// USER：用户完成了登录，进入首页
/// JOIN：用户刚刚完成注册，需要填写一些基本信息
enum UserLoginState { WAIT, NON_AUTH, USER, JOIN }

GlobalModel globalModel = GlobalModel();

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
      bool firstJoin = prefs.getBool("firstJoin") ?? false;
      if (firstJoin) {
        _userLoginState = UserLoginState.JOIN;
      } else if (id == "" || token == "") {
        _userLoginState = UserLoginState.NON_AUTH;
      } else {
        _userLoginState = UserLoginState.USER;
      }
      log("_userLoginState: " + _userLoginState.toString());
      notifyListeners();
    });
  }
}