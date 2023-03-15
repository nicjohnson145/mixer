import 'package:flutter/material.dart';

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
