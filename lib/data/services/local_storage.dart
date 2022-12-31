import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class CustomLocalStorage {
  const CustomLocalStorage(this._prefs);

  final SharedPreferences _prefs;

  String? get(LocalStorageKey key) => _prefs.getString(key.toString());

  /// Store token in device storage
  Future<bool> store(LocalStorageKey key, String token) async =>
      _prefs.setString(
        key.toString(),
        token,
      );

  /// Remove token from device storage
  Future<bool> remove(LocalStorageKey key) async =>
      _prefs.remove(key.toString());
}

enum LocalStorageKey {
  sessionToken,
}
