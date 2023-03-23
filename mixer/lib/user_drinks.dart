import 'package:flutter/material.dart';
import 'package:mixer/user_storage.dart';
import 'package:mixer/api.dart';
import 'package:mixer/services.dart';
import 'package:mixer/common.dart';
import 'package:mixer/hamburger.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mixer/protos/drink.pb.dart';
import 'package:mixer/routes.dart';
import 'package:provider/provider.dart';
import 'package:mixer/user_change_notifier.dart';

class UserDrinks extends StatefulWidget {
    String? username;

    UserDrinks({
        Key? key,
        this.username,
    }) : super(key: key);

    @override
    State<UserDrinks> createState() => _UserDrinksState();
}

class DrinkListInfo {
    final List<Drink> drinks;
    final String username;

    DrinkListInfo({
        required this.drinks,
        required this.username,
    });
}

class _UserDrinksState extends State<UserDrinks> {

    Future<Result<DrinkListInfo, ShitsFuckedError>> getFuture(BuildContext context) async {
        String username;
        if (widget.username == null) {
            var usr = Provider.of<UsernameProvider>(context, listen: false).get();
            if (usr == null) {
                return Error(ShitsFuckedError(message: "no user found in storage"));
            }
            username = usr;
        } else {
            username = widget.username!;
        }

        var api = getIt<API>();
        final apiResp = await api.listDrinksByUser(username);
        return apiResp.when(
            (success) {
                return Success(DrinkListInfo(username: username, drinks: success.drinks));
            },
            (error) {
                return Error(ShitsFuckedError(message: error.message));
            },
        );
    }

    @override
    Widget build(BuildContext context) {
        return FutureBuilder(
            future: getFuture(context),
            builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                    return loadingSpinner(context);
                }

                if (snapshot.hasError) {
                    return errorScreen(context, snapshot.error.toString());
                }

                final resp = snapshot.data as Result<DrinkListInfo, ShitsFuckedError>;
                return resp.when(
                    (success) {
                        return DrinkListView(
                            drinks: success.drinks,
                            username: success.username,
                        );
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
    String? username;

    DrinkListView({
        Key? key,
        required this.drinks,
        this.username,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Drinks"),
                actions: const [Hamburger()],
            ),
            body: getBody(context),
            floatingActionButton: getFloatingActionButton(context),
        );
    }

    Widget getBody(BuildContext context) {
        // If you're looking at someone else's drinks
        if (drinks.isEmpty && username != null) {
            return Container(
                padding: const EdgeInsets.only(
                    top: 15.0,
                    left: 15.0,
                    right: 15.0,
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
                        Navigator.of(context).pushNamed(
                            Routes.singleDrink,
                            arguments: SingleDrinkArgs(
                                drink: d,
                                username: username == null ? d.username : username!,
                            ),
                        );
                    },
                ).build(context);
            },
        );
    }

    Widget getFloatingActionButton(BuildContext context) {
        var usr = Provider.of<UsernameProvider>(context, listen: false).get();
        if (usr == null) {
            throw Exception("no user found in storage");
        }
        print(username);
        print(usr);
        if (username != null && usr != username) {
            return Container();
        }
        return FloatingActionButton(
            onPressed: () {
                Navigator.of(context).pushNamed(
                    Routes.drinkAddEdit,
                    arguments: AddEditDrinkArgs(),
                );
            },
            child: const Icon(Icons.add),
        );
    }
}

class DrinkLineItem extends StatelessWidget {
    final Drink drink;
    final void Function(Drink) onTap;

    const DrinkLineItem({
        Key? key,
        required this.drink,
        required this.onTap,
    }) : super(key: key);

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

    @override
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
