import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:mixer/api.dart';
import 'package:mixer/keys.dart';
import 'package:mixer/routes.dart';
import 'package:mixer/services.dart';
import 'package:mixer/user_storage.dart';
import 'package:provider/provider.dart';
import 'package:mixer/user_change_notifier.dart';


class LoginPage extends StatefulWidget {
    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final _formKey = GlobalKey<FormState>();
    String _username = "";
    String _password = "";

    String? Function(String?) required(String key) {
        String? inner(String? val) {
            if (val == null || val.isEmpty) {
                return "$key is required";
            }
            return null;
        }
        return inner;
    }

    void login(BuildContext context) async {
        final form = _formKey.currentState!;
        if (!form.validate()) {
            return;
        }
        form.save();

        var api = getIt<API>();
        final result = await api.login(_username, _password);
        var loginResp = result.when(
            (success) {
                return success;
            },
            (error) {
                Flushbar(
                    title: "Failed Login",
                    message: error.message,
                    duration: const Duration(seconds: 3),
                ).show(context);
                return null;
            },
        );
        if (loginResp != null) {
            var storage = getIt<Storage>();
            await storage.saveLogin(loginResp);
            Provider.of<UsernameProvider>(context, listen: false).set(loginResp.username);
            Navigator.pushReplacementNamed(context, Routes.drinksByUser);
        }
    }

    @override
    Widget build(BuildContext context) {
        final usernameField = TextFormField(
            key: KeyName.loginUsernameInput.asKey(),
            onSaved: (val) => _username = val == null ? "" : val.toString(),
            decoration: const InputDecoration(labelText:  "Username"),
            validator: required("Username"),
        );
        final passwordField = TextFormField(
            key: KeyName.loginPasswordInput.asKey(),
            obscureText: true,
            onSaved: (value) => _password = value == null ? "" : value.toString(),
            decoration: const InputDecoration(labelText: "Password"),
            validator: required("Password"),
        );
        final loginButton = ElevatedButton(
            key: KeyName.loginLoginButton.asKey(),
            child: const Text("Login"),
            onPressed: () { login(context); }
        );

        return Scaffold(
            appBar: AppBar(
                title: const Text("Login"),
            ),
            body: Container(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            const SizedBox(height: 30.0),
                            usernameField,
                            const SizedBox(height: 30.0),
                            passwordField,
                            const SizedBox(height: 30.0),
                            loginButton,
                        ],
                    ),
                ),
            ),
        );
    }
}
