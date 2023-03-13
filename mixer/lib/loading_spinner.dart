import 'package:flutter/material.dart';

Widget loadingSpinner(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Loading"),
            actions: const <Widget>[
                Hamburger(),
            ],
        ),
        body: const Center(
            child: CircularProgressIndicator(),
        ),
    );
}
