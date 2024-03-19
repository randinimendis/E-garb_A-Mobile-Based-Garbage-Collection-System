import 'package:get_storage/get_storage.dart';

class UserDefaults {
  final _storage = GetStorage();
  static final UserDefaults shared = UserDefaults._privateConstructor();

  final _keyIsFirstRun = 'is_first_run';
  final _keyHasSignedUp = 'has_signed_up';
  final _keyHasLoggedIn = 'has_logged_in';

  bool get isFirstRun => _getIsFirstRun();
  set isFirstRun(bool value) => _setIsFirstRun(value);

  bool get hasSignedUp => _getHasSignedUp();
  set hasSignedUp(bool value) => _setHasSignedUp(value);

  bool get hasLoggedIn => _getHasLoggedIn();
  set hasLoggedIn(bool value) => _setHasLoggedIn(value);

  UserDefaults._privateConstructor();

  void _setIsFirstRun(bool isFirstRun) =>
      _storage.write(_keyIsFirstRun, isFirstRun);

  bool _getIsFirstRun() => _storage.read(_keyIsFirstRun) ?? true;

  void _setHasSignedUp(bool hasSignedUp) =>
      _storage.write(_keyHasSignedUp, hasSignedUp);

  bool _getHasSignedUp() => _storage.read(_keyHasSignedUp) ?? false;

  void _setHasLoggedIn(bool hasLoggedIn) =>
      _storage.write(_keyHasLoggedIn, hasLoggedIn);

  bool _getHasLoggedIn() => _storage.read(_keyHasLoggedIn) ?? false;

}
