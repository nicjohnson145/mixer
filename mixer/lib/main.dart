import 'package:flutter/material.dart';
import 'package:mixer/foo.dart';
import 'package:mixer/login.dart';
import 'package:mixer/loading_spinner.dart';
import 'package:mixer/routes.dart';
import 'package:mixer/protos/user.pb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        var fut = Storage.getLogin();
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
            ),
            home: FutureBuilder(
                future: fut,
                builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                        return loadingSpinner(context);
                    }

                    var returnLogin = () {
                        await Storage.clear();
                        return LoginPage();
                    };

                    final resp = snapshot.data as LoginResponse;
                    if (resp.username == "") {
                        return returnLogin();
                    }

                    
                },
            ),
            home: LoginPage(),
            routes: {
                Routes.login: (context) => LoginPage(),
                Routes.foopage: (context) => FooPage(),
            },
        );
    }
}
