import 'package:flutter/material.dart';
import 'package:mixer/protos/drink.pb.dart';
import 'package:mixer/routes.dart';
import 'package:mixer/hamburger.dart';
import 'package:mixer/services.dart';
import 'package:mixer/api.dart';
import 'package:mixer/common.dart';

class DrinkDetails extends StatefulWidget {
    Drink drink;
    String username;

    DrinkDetails({
        Key? key,
        required this.drink,
        required this.username,
    }) : super(key: key);

    @override
    State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
    EdgeInsetsGeometry get verticalPadding {
        return const EdgeInsets.symmetric(vertical: 10.0);
    }

    TextStyle get labelStyle {
        return const TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
        );
    }

    Widget boolCheckbox(String text) {
        return Row(
            children: [
                const Icon(Icons.check_box_rounded, size: 15),
                const SizedBox(width: 5),
                Text(text),
            ],
        );
    }

    Widget basicValue(String label, String value) {
        return Padding(
            padding: verticalPadding,
            child: Text.rich(
                TextSpan(
                    text: "",
                    children: [
                        TextSpan(
                            text: label + ': ',
                            style: labelStyle,
                        ),
                        TextSpan(
                            text: value
                        ),
                    ],
                ),
            ),
        );
    }

    List<Widget> getIngredientsList() {
        List<Widget> ingredients = [];
        for (var i = 0; i < widget.drink.drinkData.ingredients.length; i++) {
            ingredients.add(_IngredientCard(widget.drink.drinkData.ingredients[i]));
        }
        return ingredients;
    }

    Widget getMainBody() {
        List<Widget> components = [
            basicValue("Primary Alcohol", widget.drink.drinkData.primaryAlcohol),
        ];
        if (widget.drink.drinkData.preferredGlass != "") {
            components.add(basicValue("Preferred Glass", widget.drink.drinkData.preferredGlass));
        }
        if (widget.drink.drinkData.instructions != "") {
            components.add(basicValue("Instructions", widget.drink.drinkData.instructions));
        }
        if (widget.drink.drinkData.notes != "") {
            components.add(basicValue("Notes", widget.drink.drinkData.notes));
        }

        if (widget.drink.drinkData.underDevelopment) {
            components.add(boolCheckbox("Under Development"));
        }

        if (widget.drink.drinkData.favorite) {
            components.add(boolCheckbox("Favorite"));
        }

        components.add(basicValue("Ingredients", ""));
        components.addAll(getIngredientsList());


        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Scrollbar(
                child: ListView.builder(
                    itemCount: components.length,
                    itemBuilder: (BuildContext context, int index) {
                        return components[index];
                    },
                ),
            ),
        );
    }

    Widget getFloatingActionButton(BuildContext context) {
        return FloatingActionButton(
            onPressed: () {
                Navigator.of(context).pushNamed(
                    Routes.drinkAddEdit,
                    arguments: AddEditDrinkArgs(drink: widget.drink),
                );
            },
            child: const Icon(Icons.edit),
        );
    }

    List<Widget> appBarItems(BuildContext context) {
        var widgets = <Widget>[];
        if (widget.username == widget.drink.username) {
            widgets.add(
                IconButton(
                    icon: const Icon(Icons.delete_forever),
                    onPressed: () async {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => AlertDialog(
                                title: const Text("Confirm"),
                                content: const Text("Are you sure you want to delete? This action cannot be undone"),
                                actions: <Widget>[
                                    TextButton(
                                        child: const Text('No'),
                                        onPressed: () {
                                            Navigator.of(context).pop();
                                        },
                                    ),
                                    TextButton(
                                        child: const Text('Yes'),
                                        onPressed: () async {
                                            var api = getIt<API>();
                                            var deleteResult = await api.deleteDrink(widget.drink.id);
                                            deleteResult.when(
                                                (success) {
                                                    Navigator.of(context).pushNamedAndRemoveUntil(Routes.drinksByUser, (route) => false);
                                                },
                                                (error) {
                                                    // first pop clears the confirmation dialog
                                                    Navigator.pop(context);
                                                    // second pop goes back to drinks page
                                                    Navigator.pop(context);
                                                    showErrorSnackbar(context, error.message);
                                                },
                                            );
                                        },
                                    ),
                                ],
                                elevation: 24.0,
                            ),
                        );
                    },
                )
            );
        }
        widgets.add(const Hamburger());
        return widgets;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.drink.drinkData.name),
                actions: appBarItems(context),
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: getMainBody(),
            ),
            floatingActionButton: getFloatingActionButton(context),
        );
    }
}

class _IngredientCard extends StatelessWidget {
    final String ingredient;

    const _IngredientCard(this.ingredient);

    @override build(BuildContext context) {
        return SizedBox(
            height: 35,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(ingredient),
                    ),
                ],
            ),
        );
    }
}
