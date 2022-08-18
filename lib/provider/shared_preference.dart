import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedPreference>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedPreference(sharedPreferences: sharedPrefs);
});

class SharedPreference {
  SharedPreference({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  bool getTheme() {
    return sharedPreferences.getBool(PreferenceConstant.themeStatus) ?? false;
  }

  Future<bool> setDarkTheme(bool value) {
    return sharedPreferences.setBool(PreferenceConstant.themeStatus, value);
  }

  bool getHome() {
    return sharedPreferences.getBool(PreferenceConstant.showHome) ?? false;
  }

  Future<bool> setHome(bool vlaue) {
    return sharedPreferences.setBool(PreferenceConstant.showHome, vlaue);
  }

  Future<bool> setUserUid(String uid) {
    return sharedPreferences.setString(PreferenceConstant.useruid, uid);
  }

  String getUid() {
    return sharedPreferences.getString(PreferenceConstant.useruid) ?? "";
  }

  Future<bool> setUserProfile(String path) {
    return sharedPreferences.setString(PreferenceConstant.profileImage, path);
  }

  String getUserProfile() {
    return sharedPreferences.getString(PreferenceConstant.profileImage) ?? "";
  }

  Future<bool> setNumberPlate(String path) {
    return sharedPreferences.setString(PreferenceConstant.numberPlate, path);
  }

  String getNumberPlate() {
    return sharedPreferences.getString(PreferenceConstant.numberPlate) ?? "";
  }

  Future<bool> setModel(String path) {
    return sharedPreferences.setString(PreferenceConstant.model, path);
  }

  String getModel() {
    return sharedPreferences.getString(PreferenceConstant.model) ?? "";
  }
}

class PreferenceConstant {
  static const showHome = 'showHome';
  static const themeStatus = "THEMESTATUS";
  static const useruid = "userUid";
  static const profileImage = "profileImage";
  static const numberPlate = "numberPlate";
  static const model = "model";
}
