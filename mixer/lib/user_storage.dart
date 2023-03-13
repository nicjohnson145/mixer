import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mixer/protos/user.pb.dart';

class StorageKeys {
    static const String username = "username";
    static const String refreshToken = "refresh_token";
    static const String accessToken = "access_token";
}

class Storage {
    static saveLogin(LoginResponse resp) async {
        const storage = FlutterSecureStorage();
        await storage.write(key: StorageKeys.username, value: resp.username);
        await storage.write(key: StorageKeys.accessToken, value: resp.accessToken);
        await storage.write(key: StorageKeys.refreshToken, value: resp.refreshToken);
    }

    static Future<LoginResponse> getLogin() async {
        const storage = FlutterSecureStorage();
        var resp = LoginResponse.create();
        resp.username = await getUsername();
        resp.accessToken = await getAccessToken();
        resp.refreshToken = await getRefreshToken();
        return resp;
    }

    static saveRefresh(RefreshTokenResponse resp) async {
        const storage = FlutterSecureStorage();
        await storage.write(key: StorageKeys.accessToken, value: resp.accessToken);
        await storage.write(key: StorageKeys.refreshToken, value: resp.refreshToken);
    }

    static Future<void> clear() async {
        const storage = FlutterSecureStorage();
        await storage.deleteAll();
    }

    static Future<String> _getString(String key) async {
        const storage = FlutterSecureStorage();
        String? val = await storage.read(key: key);
        if (val == null) {
            return "";
        }
        return val;
    }

    static Future<String> getAccessToken() async {
        return _getString(StorageKeys.accessToken);
    }

    static Future<String> getRefreshToken() async {
        return _getString(StorageKeys.refreshToken);
    }

    static Future<String> getUsername() async {
        return _getString(StorageKeys.username);
    }
}

