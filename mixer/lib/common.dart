import 'package:flutter/material.dart';
import 'package:mixer/routes.dart';

Widget loadingSpinner(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Loading"),
        ),
        body: const Center(
            child: CircularProgressIndicator(),
        ),
    );
}

Widget errorScreen(BuildContext context, String error) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Shit's Fucked"),
        ),
        body: Center(
            child: Column(
                children: [
                    Text(error),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        child: const Text("Logout and start over"),
                        onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (_) => false);
                        },
                    ),
                ],
            ),
        ),
    );
}

class ShitsFuckedError {
    String message;

    ShitsFuckedError({
        required this.message,
    });
}

void showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(message),
        ),
    );
}
