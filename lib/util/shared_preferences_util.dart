import 'package:shared_preferences/shared_preferences.dart';

//缓存处理闭包，不要从这个闭包中操作 BuildContext 即 context 相关的东西！！！
typedef Handler(SharedPreferences sp);

class SharedPreferencesUtil {

  static SharedPreferences prefs;

  static handleCache(Handler handler) async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    handler(prefs);
  }
}