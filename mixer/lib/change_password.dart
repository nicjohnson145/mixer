import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:mixer/api.dart';
import 'package:mixer/common.dart';
import 'package:mixer/protos/drink.pb.dart';
import 'package:mixer/keys.dart';
import 'package:mixer/hamburger.dart';
import 'package:mixer/routes.dart';
import 'package:mixer/services.dart';

class ChangePassword extends StatefulWidget {
    ChangePassword({
        Key? key,
    }) : super(key: key);

    @override
    _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
    bool showSpinner = false;

    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmpasswordController = TextEditingController();

    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Change Password"),
                actions: [newHamburger()],
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 25.0,
                ),
                child: showSpinner ? loadingSpinner(context) : buildForm(context),
            ),
            floatingActionButton: Builder(
                builder: (context) {
                    return FloatingActionButton(
                        onPressed: () { submitChange(context); },
                        child: const Icon(Icons.check),
                    );
                }
            ),
        );
    }

    Widget buildForm(BuildContext context) {
        List<Widget> widgets = [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "New Password",
                    ),
                ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                    controller: confirmpasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Confirm Password",
                    ),
                ),
            ),
        ];

        return Scrollbar(
            child: ListView.builder(
                itemCount: widgets.length,
                itemBuilder: (BuildContext context, int index) {
                    return widgets[index];
                },
            ),
        );
    }

    void submitChange(BuildContext context) async {
        if (passwordController.text.isEmpty) {
            return showErrorSnackbar(context, "Password cannot be empty");
        }
        if (passwordController.text != confirmpasswordController.text) {
            return showErrorSnackbar(context, "Passwords do not match");
        }

        setState(() {
            showSpinner = true;
        });

        var api = getIt<API>();
        var resp = await api.changePassword(passwordController.text);
        resp.when(
            (success) {
                Navigator.of(context).pushNamedAndRemoveUntil(Routes.drinksByUser, (route) => false);
            },
            (error) {
                setState(() {
                    showSpinner = false;
                });
                return showErrorSnackbar(context, error.message);
            },
        );
    }
}
