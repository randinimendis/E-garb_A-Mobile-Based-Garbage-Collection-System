import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/business_models/user.dart';

class SecureStorage extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  final _keyUser = "user";
  final _keyToken = "token";
  final _primaryUser = "primary";
  final _activeUser = "active";

  static final SecureStorage shared = SecureStorage._privateConstructor();

  final Map<String, User?> _users = {};
  String? token;

  SecureStorage._privateConstructor();

  User? get primaryUser => _users[_primaryUser];

  User? get user => _users[_activeUser];

  bool get isPrimary => primaryUser == null || primaryUser?.id == user?.id;

  Future<void> init() async {
    _users.addAll(await _getUser());
    token = await _getToken();
  }

  Future setUser(User user) async {
    if (primaryUser == null || primaryUser?.id == user.id) {
      _users[_primaryUser] = user;
    }
    _users[_activeUser] = user;
    final value = json.encode(_users);
    await _storage.write(key: _keyUser, value: value);
  }

  Future<Map<String, User?>> _getUser() async {
    final value = await _storage.read(key: _keyUser);
    return (value?.isEmpty ?? true) ? null : json.decode(value ?? '');
  }

  Future setToken(String token) async {
    this.token = token;
    await _storage.write(key: _keyToken, value: token);
  }

  Future<String?> _getToken() async {
    return await _storage.read(key: _keyToken);
  }

  Future clearSecureStorage() async => await _storage.deleteAll();

  Future removeAccount() async {
    _users.clear();
    await _storage.delete(key: _keyUser);
  }
}
