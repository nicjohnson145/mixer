import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mixer/protos/user.pb.dart';

class StorageKeys {
    static const String username = "username";
    static const String refreshToken = "refresh_token";
    static const String accessToken = "access_token";
}

abstract class Storage {
    Future<LoginResponse> getLogin();
    Future<void> saveLogin(LoginResponse resp);
    Future<void> saveRefresh(RefreshTokenResponse resp);
    Future<String> getUsername();
}

class SecureStorage implements Storage {
    final FlutterSecureStorage _storage;

    SecureStorage() : _storage = const FlutterSecureStorage();

    @override
    Future<void> saveLogin(LoginResponse resp) async {
        await _storage.write(key: StorageKeys.username, value: resp.username);
        await _storage.write(key: StorageKeys.accessToken, value: resp.accessToken);
        await _storage.write(key: StorageKeys.refreshToken, value: resp.refreshToken);
    }

    @override
    Future<LoginResponse> getLogin() async {
        var resp = LoginResponse.create();
        resp.username = await _getString(StorageKeys.username);
        resp.accessToken = await _getString(StorageKeys.accessToken);
        resp.refreshToken = await _getString(StorageKeys.refreshToken);
        return resp;
    }

    @override
    Future<void> saveRefresh(RefreshTokenResponse resp) async {
        await _storage.write(key: StorageKeys.accessToken, value: resp.accessToken);
        await _storage.write(key: StorageKeys.refreshToken, value: resp.refreshToken);
    }

    @override
    Future<String> getUsername() async {
        return await _getString(StorageKeys.username);
    }

    Future<String> _getString(String key) async {
        String? val = await _storage.read(key: key);
        if (val == null) {
            return "";
        }
        return val;
    }
}
