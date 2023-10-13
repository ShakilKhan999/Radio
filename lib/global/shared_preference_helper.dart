import 'package:relaks_media/global/constants.dart';
import 'package:relaks_media/models/login_response.dart';
import 'package:relaks_media/models/otp_response.dart';
import 'package:relaks_media/models/signup_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  Future<void> saveMemberData({required LoginResponse loginResponse}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(token, loginResponse.results!.token!);
    prefs.setInt(id, loginResponse.results!.user!.id!);
    prefs.setString(email, loginResponse.results!.user!.email ?? 'N/A');
    prefs.setString(phone, loginResponse.results!.user!.phone ?? 'N/A');
    prefs.setString(name, loginResponse.results!.user!.name ?? 'N/A');
    prefs.setBool(isVerified, loginResponse.results!.user!.isVerified ?? false);
  }

  Future<void> saveMemberDataSignup({required OtpResponse otpResponse}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(token, otpResponse.results!.token!);
    prefs.setInt(id, otpResponse.results!.user!.id!);
    prefs.setString(email, otpResponse.results!.user!.email ?? 'N/A');
    prefs.setString(phone, otpResponse.results!.user!.phone ?? 'N/A');
    prefs.setString(name, otpResponse.results!.user!.name ?? 'N/A');

    prefs.setString(
        referralNumber, otpResponse.results!.user!.referralId ?? 'N/A');
    prefs.setInt(totalCoin, otpResponse.results!.user!.totalCoins ?? 0);

    prefs.setBool(isVerified, otpResponse.results!.user!.isVerified ?? false);
  }

  Future<void> setLoginStatus({required bool status}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLogin, status);
  }

  Future<String?> getString({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<int?> getInt({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<double?> getDouble({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  Future<bool?> getBool({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  Future<void> updateString(
      {required String key, required String value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<void> updateInt({required String key, required int value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<void> updateDouble(
      {required String key, required double value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  Future<void> updateBool({required String key, required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }
}
