import 'package:mixer/protos/user.pb.dart';
import 'package:mixer/protos/drink.pb.dart';
import 'package:mixer/urls.dart';
import 'package:mixer/services.dart';
import 'package:mixer/user_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:multiple_result/multiple_result.dart';

class ApiError {
    int statusCode;
    String message;

    ApiError({
        required this.statusCode,
        required this.message,
    });
}

abstract class API {
    Future<Result<LoginResponse, ApiError>> login(String username, String password);
    Future<Result<void, ApiError>> refresh();
    Future<Result<ListDrinkResponse, ApiError>> listDrinksByUser(String username);
}

class HTTPAPI implements API {
    http.Client client;

    String? accessToken;
    String? refreshToken;

    HTTPAPI({
        required this.client,
    });

    Map<String, String> headers() {
        return {
            "authorization": accessToken!,
        };
    }

    @override
    Future<Result<LoginResponse, ApiError>> login(String username, String password) async {
        var request = LoginRequest.create();
        request.username = username;
        request.password = password;

        final resp = await http.post(
            Uri.parse(Urls.login()),
            body: json.encode(request.toProto3Json()),
        );

        var body = jsonDecode(resp.body);
        if (resp.statusCode != 200) {
            return Error(ApiError(statusCode: resp.statusCode, message: body["message"]));
        }
        return Success(LoginResponse.create()..mergeFromProto3Json(body));
    }

    Future<void> setAuth() async {
        var storage = getIt<Storage>();
        var resp = await storage.getLogin();
        accessToken = resp.accessToken;
        refreshToken = resp.refreshToken;
    }

    @override
    Future<Result<void, ApiError>> refresh() async {
        await setAuth();
        final resp = await http.post(
            Uri.parse(Urls.refresh()),
            body: json.encode({"refresh_token": refreshToken}),
        );

        if (resp.statusCode != 200) {
            return Error(ApiError(statusCode: resp.statusCode, message: "unable to refresh"));
        }
        var body = jsonDecode(resp.body);
        var storage = getIt<Storage>();
        await storage.saveLogin(LoginResponse.create()..mergeFromProto3Json(body));
        return const Success(null);
    }

    @override
    Future<Result<ListDrinkResponse, ApiError>> listDrinksByUser(String username) async {
        await setAuth();
        final resp = await http.get(
            Uri.parse(Urls.listByUser(username)),
            headers: headers(),
        );

        if (resp.statusCode == 401) {
            final refreshResp = await refresh();
            return refreshResp.when(
                (success) {
                    return listDrinksByUser(username);
                },
                (error) {
                    return Error(error);
                },
            );
        }

        var body = jsonDecode(resp.body);
        if (resp.statusCode != 200) {
            return Error(ApiError(statusCode: resp.statusCode, message: body["message"]));
        }
        return Success(ListDrinkResponse.create()..mergeFromProto3Json(body));
    }
}
