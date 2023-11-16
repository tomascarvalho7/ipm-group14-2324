import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../domain/user_info_cache.dart';

class UserStorage {

  // We're using FlutterSecureStorage instead of regular shared preferences because
  // in this way the data is encrypted and cannot be easily interpreted by third-parties.
  late final _storage = const FlutterSecureStorage();

  /// Retrieves all the cached user information and parses the json into a [UserInfoCache] instance.
  Future<UserInfoCache?> getUser() async {
    final user = await _storage.read(key: _userStorageName);
    return userInfoFromJson(user);
  }

  /// Stores the user information as a JSON string.
  /// Expiry time is important because we want to have a validity timeout for the stored information.
  void setUser(String id, String name, String email) async {
    final userInfo = UserInfoCache(
        id: id,
        name: name,
        email: email,
        );

    await _storage.write(key: _userStorageName, value: userInfoToJson(userInfo));
  }

  /// Deletes the stored user entry.
  void deleteUser() async {
    await _storage.delete(key: _userStorageName);
  }

  // storage name constant values
  static const String _userStorageName = "user";
}

/// Converts a [UserInfoCache] object to a JSON string.
///
/// Returns a JSON-encoded string representation of the [UserInfoCache] object.
String userInfoToJson(UserInfoCache userInfo) {
  final Map<String, dynamic> data = userInfo.toJson();
  return json.encode(data);
}

/// Converts a JSON string to a [UserInfoCache] instance.
///
/// Returns a [UserInfoCache] object.
UserInfoCache? userInfoFromJson(String? jsonString) {
  if (jsonString == null) return null;

  final Map<String, dynamic> data = json.decode(jsonString);
  return UserInfoCache.fromJson(data);
}
