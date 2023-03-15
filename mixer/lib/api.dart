import 'package:mixer/protos/user.pb.dart';
import 'package:mixer/urls.dart';
import 'package:mixer/user_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:multiple_result/multiple_result.dart';

class ApiMgr {
    static ApiSvc? _instance;

    static ApiSvc getInstance() {
        _instance ??= ApiSvc();
        return _instance!;
    }
}

class ApiError {
    int status_code;
    String message;

    ApiError({
        required this.status_code,
        required this.message,
    });
}

class ApiSvc {
    String? accessToken;
    String? refreshToken;

    Future<Result<LoginResponse, ApiError>> login(String username, String password) async {
        var request = LoginRequest.create();
        request.username = username;
        request.password = password;

        final resp = await http.post(
            Uri.parse(Urls.login),
            body: json.encode(request.toProto3Json()),
        );

        var body = jsonDecode(resp.body);
        if (resp.statusCode != 200) {
            return Error(ApiError(status_code: resp.statusCode, message: body["message"]));
        }
        return Success(LoginResponse.create()..mergeFromProto3Json(body));
    }

    Future<void> setAuth() async {
        var resp = await Storage.getLogin();
        accessToken = resp.accessToken;
        refreshToken = resp.refreshToken;
    }

    Future<Result<void, ApiError>> refresh() async {
        await setAuth();
        final resp = await http.post(
            Uri.parse(Urls.refresh),
            body: json.encode({"refresh_token": refreshToken}),
        );

        if (resp.statusCode != 200) {
            return Error(ApiError(status_code: resp.statusCode, message: "unable to refresh"));
        }
        var body = jsonDecode(resp.body);
        await Storage.saveLogin(LoginResponse.create()..mergeFromProto3Json(body));
        return const Success(null);
    }

}
