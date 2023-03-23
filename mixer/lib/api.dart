import 'package:mixer/protos/user.pb.dart';
import 'package:mixer/protos/drink.pb.dart';
import 'package:mixer/urls.dart';
import 'package:mixer/services.dart';
import 'package:mixer/user_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:multiple_result/multiple_result.dart';
import 'package:fixnum/fixnum.dart';

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
    Future<Result<void, ApiError>> createDrink(DrinkData data);
    Future<Result<void, ApiError>> updateDrink(Int64 id, DrinkData data);
    Future<Result<void, ApiError>> deleteDrink(Int64 id);
    Future<Result<void, ApiError>> copyDrink(Int64 id, String name);
    Future<Result<ListUsersResponse, ApiError>> listUsers();
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

    @override
    Future<Result<Int64, ApiError>> createDrink(DrinkData data) async {
        await setAuth();
        var req = CreateDrinkRequest(drinkData: data);
        final resp = await http.post(
            Uri.parse(Urls.create()),
            headers: headers(),
            body: json.encode(req.toProto3Json()),
        );

        if (resp.statusCode == 401) {
            final refreshResp = await refresh();
            return refreshResp.when(
                (success) {
                    return createDrink(data);
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
        var createResp = CreateDrinkResponse()..mergeFromProto3Json(body);
        return Success(createResp.id);
    }

    @override
    Future<Result<void, ApiError>> updateDrink(Int64 id, DrinkData data) async {
        await setAuth();
        var req = UpdateDrinkRequest(id: id, drinkData: data);
        final resp = await http.put(
            Uri.parse(Urls.update()),
            headers: headers(),
            body: json.encode(req.toProto3Json()),
        );

        if (resp.statusCode == 401) {
            final refreshResp = await refresh();
            return refreshResp.when(
                (success) {
                    return updateDrink(id, data);
                },
                (error) {
                    return Error(error);
                },
            );
        }

        if (resp.statusCode != 200) {
            var body = jsonDecode(resp.body);
            return Error(ApiError(statusCode: resp.statusCode, message: body["message"]));
        }
        return const Success(null);
    }

    @override
    Future<Result<void, ApiError>> deleteDrink(Int64 id) async {
        await setAuth();

        final resp = await http.delete(
            Uri.parse(Urls.delete(id)),
            headers: headers()
        );

        if (resp.statusCode == 401) {
            final refreshResp = await refresh();
            return refreshResp.when(
                (success) {
                    return deleteDrink(id);
                },
                (error) {
                    return Error(error);
                },
            );
        }

        if (resp.statusCode != 200) {
            var body = jsonDecode(resp.body);
            return Error(ApiError(statusCode: resp.statusCode, message: body["message"]));
        }

        return const Success(null);
    }

    @override
    Future<Result<ListUsersResponse, ApiError>> listUsers() async {
        await setAuth();

        final resp = await http.get(
            Uri.parse(Urls.listUsers()),
            headers: headers()
        );

        if (resp.statusCode == 401) {
            final refreshResp = await refresh();
            return refreshResp.when(
                (success) {
                    return listUsers();
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

        return Success(ListUsersResponse.create()..mergeFromProto3Json(body));
    }

    @override
    Future<Result<void, ApiError>> copyDrink(Int64 id, String name) async {
        await setAuth();

        var req = CopyDrinkRequest(newName: name);
        final resp = await http.post(
            Uri.parse(Urls.copy(id)),
            headers: headers(),
            body: json.encode(req.toProto3Json()),
        );

        if (resp.statusCode == 401) {
            final refreshResp = await refresh();
            return refreshResp.when(
                (success) {
                    return copyDrink(id, name);
                },
                (error) {
                    return Error(error);
                },
            );
        }

        if (resp.statusCode != 200) {
            var body = jsonDecode(resp.body);
            return Error(ApiError(statusCode: resp.statusCode, message: body["message"]));
        }
        return const Success(null);
    }
}
