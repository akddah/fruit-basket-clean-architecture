import 'package:shared_preferences/shared_preferences.dart';

class UserCashed {
  late final SharedPreferences preferences;
  String name = '';
  String phone = '';
  String token = '';
  bool get isAuth => token.isNotEmpty;

  init() async {
    preferences = await SharedPreferences.getInstance();
    token = preferences.getString("token") ?? '';
    if (isAuth) {
      name = preferences.getString("name") ?? '';
      phone = preferences.getString("phone") ?? '';
    }
  }

  clear() {
    preferences.remove("token");
    preferences.remove("name");
    preferences.remove("phone");
  }

  set() {
    preferences.setString("token", token);
    preferences.setString("name", name);
    preferences.setString("phone", phone);
  }
}
