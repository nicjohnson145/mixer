import 'package:flutter/material.dart';
import 'package:mixer/user_storage.dart';
import 'package:mixer/api.dart';
import 'package:mixer/common.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mixer/protos/drink.pb.dart';

class UserDrinks extends StatefulWidget {
    String? username;

    UserDrinks({
        Key? key,
        this.username,
    }) : super(key: key);

    @override
    State<UserDrinks> createState() => _UserDrinksState();
}

class _UserDrinksState extends State<UserDrinks> {

    Future<Result<ListDrinkResponse, ShitsFuckedError>> getFuture() async {
        String username;
        if (widget.username == null) {
            String name = await Storage.getUsername();
            if (name == "") {
                return Error(ShitsFuckedError(message: "no user found in storage"));
            }
            username = name;
        } else {
            username = widget.username!;
        }

        final apiResp = await ApiMgr.getInstance().listDrinksByUser(username);
        return apiResp.when(
            (success) {
                return Success(success);
            },
            (error) {
                return Error(ShitsFuckedError(message: error.message));
            },
        );
    }

    @override
    Widget build(BuildContext context) {
        return FutureBuilder(
            future: getFuture(),
            builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                    return loadingSpinner(context);
                }

                final resp = snapshot.data as Result;
                return resp.when(
                    (success) {
                        return const Text("this is the drink page");
                    },
                    (error) {
                        return errorScreen(context, error.message);
                    },
                );
            }
        );
    }
}

class DrinkListView extends StatelessWidget {
    List<Drink> drinks;

    DrinkListView({
        Key? key,
        required this.drinks,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Drinks"),
            ),
            body: const Text("this is where the drinks are"),
        );
    }
}
