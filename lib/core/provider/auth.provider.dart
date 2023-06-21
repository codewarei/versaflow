import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intellisuite/ui/root.dart';
import 'package:intellisuite/ui/screens/auth/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../ui/utils/router.dart';
import '../constants/consts.dart';
import '../database/db.provider.dart';

class AuthenticationProvider extends ChangeNotifier {
  String key = r'$2y$10$rO4mTY12aZPeuV570behsOujwA/kHChV.46RLDBTmox1V3aNekc4O';

  ///Base Url
  final baseUrl = AppUrl.baseUrl;
  // final requestRegisterUrl = AppUrl.registerUrl;

  ///Setter
  bool _isLoading = false;
  String _resMessage = '';

  //Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void registerUser({
    required String company,
    required String contact,
    required String email,
    required String mobile,
    required String newsletter,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url =
        "$baseUrl/register?company=$company&contact=$contact&email=$email&mobile=$mobile&newsletter=$newsletter";

    // final body = {
    //   "company": first_name,
    //   "contact": last_name,
    //   "email": email,
    //   "mobile": password,
    //   "newsletter": cell_number,
    // };
    print(url);

    try {
      http.Response req = await http.post(Uri.parse(url));

      if (req.statusCode == 200 || req.statusCode == 201) {
        _isLoading = false;
        _resMessage = "Account created!";
        notifyListeners();
        PageNavigator(ctx: context).nextPageOnly(page: Container());
      } else {
        final res = json.decode(req.body);

        _resMessage = res['message'];

        print(res);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available`";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again`";
      notifyListeners();

      print(":::: $e");
    }
  }

  //Login
  void loginUser({
    required String username,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();

    String url = '$baseUrl/auth?username=$username&password=$password';

    try {
      http.Response req = await http.post(
        Uri.parse(url),
        headers: {
          "Content-type": "application/json",
        },
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);

        print(res);
        _isLoading = false;
        // _resMessage = "Login Successfully!";
        final message = res['message'];
        ScaffoldMessenger.of(context!)
            .showSnackBar(SnackBar(content: Text(message)));
        notifyListeners();

        ///Save users data and then navigate to homepage
        final token = res['token'];
        print(token);

        await prefs.setString('token', '$token');
        DatabaseProvider().saveToken(token);
        PageNavigator(ctx: context).nextPageOnly(page: const RootApp());
      } else {
        final res = json.decode(req.body);
        final message = res['message'];
        ScaffoldMessenger.of(context!)
            .showSnackBar(SnackBar(content: Text(message)));
        print(res);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available`";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Invalid client credentials";
      notifyListeners();

      print(":::: $e");
    }
  }

  //Login
  void loginWeb({
    var mobile_number,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String urlWeb =
        'https://ct.versaflow.io/erp_api/getlogin?mobile_number=$mobile_number&key=$key';

    try {
      http.Response req = await http.get(
        Uri.parse(urlWeb),
        headers: {
          "Content-type": "application/json",
        },
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);

        print(res);
        _isLoading = false;
        _resMessage = "Login Successfully!";
        notifyListeners();

        ///Save users data and then navigate to homepage

        PageNavigator(ctx: context).nextPageOnly(page: const OTPScreen());
      } else {
        final res = json.decode(req.body);

        print(res);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available`";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Invalid client credentials";
      notifyListeners();

      print(":::: $e");
    }
  }

  //OTP
  void otp({
    var mobile_number,
    var code,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    // String url = '$baseUrl/auth?mobile_number=$mobile_number&key=$key';
    String urlWeb =
        'https://ct.versaflow.io/erp_api/postsmstoken?mobile_number=$mobile_number&key=$key&code=$code';

    try {
      http.Response req = await http.get(
        Uri.parse(urlWeb),
        headers: {
          "Content-type": "application/json",
        },
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);

        print(res);
        _isLoading = false;
        _resMessage = "Login Successfully!";
        notifyListeners();

        ///Save users data and then navigate to homepage

        // PageNavigator(ctx: context).nextPageOnly(page: const RootApp());
      } else {
        final res = json.decode(req.body);

        print(res);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available`";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Invalid client credentials";
      notifyListeners();

      print(":::: $e");
    }
  }

  void clear() {
    _resMessage = "";
    // _isLoading = false;
    notifyListeners();
  }
}
