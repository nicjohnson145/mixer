import 'package:flutter/material.dart';

class FooPage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Foo Page"),
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: const Text("This is the foo page"),
            ),
        );
    }
}
