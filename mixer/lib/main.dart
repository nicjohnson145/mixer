import 'package:flutter/material.dart';
import 'package:mixer/foo.dart';
import 'package:mixer/login.dart';
import 'package:mixer/user_storage.dart';
import 'package:mixer/api.dart';
import 'package:mixer/loading_spinner.dart';
import 'package:mixer/routes.dart';
import 'package:multiple_result/multiple_result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
            ),
            home: FutureBuilder(
                future: rootFuture(),
                builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                        return loadingSpinner(context);
                    }

                    final result = snapshot.data as dynamic;
                    final page = result.when(
                        (success) {
                            return FooPage();
                        },
                        (error) {
                            return LoginPage();
                        }
                    );
                    return page;
                },
            ),
            routes: {
                Routes.login: (context) => LoginPage(),
                Routes.foopage: (context) => FooPage(),
            },
        );
    }

    Future<Result<void, Exception>> rootFuture() async {
        var loginInfo = await Storage.getLogin();
        // If we didn't find anything
        if (loginInfo.username == "") {
            return Error(Exception("no data found"));
        }

        // We found some info, see if the refresh token is still good
        final refresh = await ApiMgr.getInstance().refresh();
        return refresh.when(
            (success) {
                return const Success(null);
            },
            (error) {
                return Error(Exception("could not refresh"));
            }
        );
    }

}
