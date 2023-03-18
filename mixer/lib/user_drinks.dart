import 'package:flutter/material.dart';
import 'package:mixer/user_storage.dart';
import 'package:mixer/api.dart';
import 'package:mixer/services.dart';
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
            var storage = getIt<Storage>();
            String name = await storage.getUsername();
            if (name == "") {
                return Error(ShitsFuckedError(message: "no user found in storage"));
            }
            username = name;
        } else {
            username = widget.username!;
        }

        var api = getIt<API>();
        final apiResp = await api.listDrinksByUser(username);
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
                        return DrinkListView(drinks: success.drinks);
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
            body: getBody(context),
        );
    }

    Widget getBody(BuildContext context) {
        // If you're looking at someone else's drinks
        if (drinks.isEmpty) {
            return Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 15.0,
                ),
                child: const Text("Such empty"),
            );
        }

        var sortedDrinks = List<Drink>.from(drinks);
        sortedDrinks.sort((a, b) => a.drinkData.name.compareTo(b.drinkData.name));
        return ListView.builder(
            itemCount: sortedDrinks.length,
            itemBuilder: (BuildContext context, int i) {
                return DrinkLineItem(
                    drink: sortedDrinks[i],
                    onTap: (Drink d) {
                        print(d.drinkData.name);
                    },
                ).build(context);
            },
        );
    }
}

class DrinkLineItem extends StatelessWidget {
    final Drink drink;
    final void Function(Drink) onTap;

    const DrinkLineItem({
        required this.drink,
        required this.onTap,
    });

    Widget nameRow(BuildContext context) {
        List<Widget> children = [
            Text(
                drink.drinkData.name,
                style: Theme.of(context).textTheme.titleMedium,
            ),
        ];
        if (drink.drinkData.underDevelopment) {
            children.add(cardIcon(Icons.science_rounded));
        }
        if (drink.drinkData.favorite) {
            children.add(cardIcon(Icons.star));
        }
        return Row(children: children);
    }

    Widget cardIcon(IconData i) {
        return Row(
            children:[
                const SizedBox(width: 15),
                Icon(i, size: 16),
            ],
        );
    }

    Widget build(BuildContext context) {
        return Card(
            child: InkWell(
                onTap: () {
                    onTap(drink);
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10.0,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            nameRow(context),
                            Text(
                                drink.drinkData.primaryAlcohol,
                                style: Theme.of(context).textTheme.titleSmall,
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}