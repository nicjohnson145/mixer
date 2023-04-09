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

class DrinkListView extends StatefulWidget {
    List<Drink> drinks;
    String? username;
    bool Function(Drink)? filter;

    DrinkListView({
        Key? key,
        required this.drinks,
        this.username,
    }) : super(key: key);

    @override
    _DrinkListViewState createState() => _DrinkListViewState();
}

class _DrinkListViewState extends State<DrinkListView> {
    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        var title = "Drinks";
        if (widget.filter != null) {
            title = "Drinks (filtered)";
        }

        var actions = [
            IconButton(
                icon: const Icon(Icons.search_sharp),
                onPressed: () {
                    Navigator.of(context).pushNamed(
                        Routes.drinkFilter,
                        arguments: DrinkFilterArgs(
                            drinks: widget.drinks,
                            setFilter: (func) {
                                setState(() {
                                    widget.filter = func;
                                });
                                Navigator.of(context).pop();
                            },
                        ),
                    );
                },
            ),
            newHamburger(),
        ];
        if (widget.filter != null) {
            actions.insert(
                0,
                IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                        setState(() {
                            widget.filter = null;
                        });
                    },
                ),
            );
        }
        return Scaffold(
            appBar: AppBar(
                title: Text(title),
                actions: actions,
            ),
            body: getBody(context),
            floatingActionButton: getFloatingActionButton(context),
        );
    }

    Widget getBody(BuildContext context) {
        // If you're looking at someone else's drinks
        if (widget.drinks.isEmpty && widget.username != null) {
            return Container(
                padding: const EdgeInsets.only(
                    top: 15.0,
                    left: 15.0,
                    right: 15.0,
                ),
                child: const Text("Such empty"),
            );
        }

        var sortedDrinks = List<Drink>.from(widget.drinks);
        sortedDrinks.sort((a, b) => a.drinkData.name.compareTo(b.drinkData.name));
        if (widget.filter != null) {
            sortedDrinks.retainWhere(widget.filter!);
        }
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
                                username: widget.username == null ? d.username : widget.username!,
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
        if (widget.username != null && usr != widget.username) {
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
