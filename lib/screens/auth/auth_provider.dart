import "dart:async";

import "package:flutter/foundation.dart";
import "package:http/http.dart" as http;
import "package:http/http.dart";

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool _togle = true;
  bool get loading => _loading;
  bool get togle => _togle;
  void setLoading(bool load) {
    _loading = load;
    notifyListeners();
  }

  void visibity(bool togle) {
    _togle = !togle;
    notifyListeners();
  }

  Future<bool> getLogin(String email, String password) async {
    bool res = false;
    setLoading(true);
    try {
      Response response = await http.post(
          Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        setLoading(false);

        print("succesfull ");
        res = true;
      } else {
        setLoading(false);

        print("failed");
      }
    } catch (e) {
      setLoading(false);

      print(e.toString());
    }
    return res;
  }
}
