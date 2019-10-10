import 'dart:async';
import 'package:dio/dio.dart';

class AuthApi {

  static final String authHost = "https://gateway.vidovision.com/auth";

  //登录
  static Future<Map> login(String phone, String pass) async {
    Dio dio = Dio()..options.baseUrl = authHost;
    String errMsg = "";
    var response = await dio.post("/api/auth/login", data: {"phone": phone, "password": pass}).catchError((err) {
      print("登录错误：" + err.toString());
      if (err.toString().contains("302")) {
        // 302 代表密码或用户名错误
        errMsg = "302";
      } else {
        //网络错误
        errMsg = "netErr";
      }
    });
    print(response.data);
    if (errMsg == "") {
      Map map = response.data;
      map["errMsg"] = "success";
      return map;
    } else {
      return {"errMsg": errMsg};
    }
  }

  //重置密码
  static Future<String> resetPassword(String phone, String newPass, String secondNewPass) async {
    Dio dio = Dio()..options.baseUrl = authHost;
    var response = await dio.post("/api/auth/resetPassword", data: FormData.fromMap({
      "phone": phone,
      "password": newPass,
      "password2": secondNewPass
    }));
    print(response.data);
    return response.data;
  }
}