import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_storage.g.dart';

class AppStorage {
  // SharedPreferences? _box;
  final _tokenKey = 'token';
  final _isAdmin = 'admin';
  final userId = 'userId';

  Future<String?> getToken() async {
    final _box = await SharedPreferences.getInstance();
    return _box.getString(_tokenKey);
  }

  Future<void> putToken(String token) async {
    final _box = await SharedPreferences.getInstance();
    await _box.setString(_tokenKey, token);
  }

  Future<void> putUserType(bool type) async {
    final _box = await SharedPreferences.getInstance();
    await _box.setBool(_isAdmin, type);
  }

  Future<bool?> getUserType() async {
    final _box = await SharedPreferences.getInstance();
    return _box.getBool(_isAdmin);
  }

  Future<String?> getUserId() async {
    final _box = await SharedPreferences.getInstance();
    return _box.getString(userId);
  }

  Future<void> putUserId(String token) async {
    final _box = await SharedPreferences.getInstance();
    await _box.setString(userId, token);
  }

  /// for clearing all data in box
  Future<void> clearAllData() async {
    final _box = await SharedPreferences.getInstance();
    await _box.clear();
  }
}

@riverpod
AppStorage appStorage(AppStorageRef ref) => AppStorage();
