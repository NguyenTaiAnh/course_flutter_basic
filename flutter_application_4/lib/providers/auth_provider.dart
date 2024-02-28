import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String _token = '';
  int _expires_in = 0;

  late Timer timer;

  bool get isAuth {
    return _token.isNotEmpty;
  }

  Future<void> _authencation(String email, String password, String type) async {
    const url = "https://apiforlearning.zendvn.com/api/auth/login";
    try {
      final resp = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': ' application/json; charset=utf-8'
        },
        body: jsonEncode(
          {"email": email, "password": password},
        ),
      );
      print(resp);
      final resData = jsonDecode(resp.body);
      _token = resData["access_token"];
      // _expires_in = resData["expires_in"];
      _expires_in = 10;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      notifyListeners();
      DateTime timeNow = DateTime.now();
      DateTime timeExpired = timeNow.add(
        Duration(seconds: _expires_in),
      );
      timerToken(timeExpired);
      final userInfo = jsonEncode(
          {"token": _token, "expires_in": timeExpired.toIso8601String()});
      await prefs.setString("user_info", userInfo);
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String password) {
    _authencation(email, password, "login");
  }

  Future<void> logout() async {
    print("logout");
    _token = '';
    _expires_in = 0;
    notifyListeners();
    stopTokenTimer();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("user_info");
  }

  Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("user_info")) {
      return false;
    }
    final data = jsonDecode(prefs.getString('userData') ?? '');
    DateTime expires = DateTime.parse(data['expires']);
    timerToken(expires);
    return true;
  }

  Future<void> checkTimeToken() async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonDecode(prefs.getString("user_info") ?? '');
    print(data);
    DateTime expires = DateTime.parse(data["expires_in"]);
    if (DateTime.now().isAfter(expires)) {
      logout();
    }
  }

  void timerToken(DateTime expires_in) {
    var time = expires_in.difference(DateTime.now());
    timer = Timer(time, checkTimeToken);
    print(time);
  }

  void stopTokenTimer() {
    timer.cancel();
  }
}
