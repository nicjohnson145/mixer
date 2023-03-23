import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:mixer/api.dart';
import 'package:mixer/common.dart';
import 'package:mixer/protos/drink.pb.dart';
import 'package:mixer/keys.dart';
import 'package:mixer/hamburger.dart';
import 'package:mixer/routes.dart';
import 'package:mixer/services.dart';

class DrinkAddEdit extends StatefulWidget {
    Drink? drink;

    DrinkAddEdit({
        Key? key,
        this.drink,
    }) : super(key: key);

    @override
    _DrinkAddEditState createState() => _DrinkAddEditState();
}

class _DrinkAddEditState extends State<DrinkAddEdit> {
    TextEditingController nameController = TextEditingController();
    TextEditingController primaryAlcoholController = TextEditingController();
    TextEditingController preferredGlassController = TextEditingController();
    TextEditingController instructionsController = TextEditingController();
    TextEditingController newIngredientController = TextEditingController();
    List<TextEditingController> ingredientsControllers = [];
    TextEditingController notesController = TextEditingController();
    List<String> ingredients = [];
    DrinkPublicity? publicity;
    bool underDevelopment = false;
    bool favorite = false;

    List<FocusNode> ingredientsFocusNodes = [];
    FocusNode newIngredientFocus = FocusNode();
    Int64? id;
    bool showSpinner = false;

    @override
    void initState() {
        super.initState();
        if (widget.drink != null) {
            nameController.text = widget.drink!.drinkData.name;
            primaryAlcoholController.text = widget.drink!.drinkData.primaryAlcohol;
            if (widget.drink!.drinkData.preferredGlass != "") {
                preferredGlassController.text = widget.drink!.drinkData.preferredGlass;
            }
            if (widget.drink!.drinkData.instructions != "") {
                instructionsController.text = widget.drink!.drinkData.instructions;
            }
            if (widget.drink!.drinkData.notes != "") {
                notesController.text = widget.drink!.drinkData.notes;
            }
            ingredients.addAll(widget.drink!.drinkData.ingredients);
            for (var i = 0; i < ingredients.length; i++) {
                ingredientsControllers.add(TextEditingController(text: ingredients[i]));
                ingredientsFocusNodes.add(FocusNode());
            }
            id = widget.drink!.id;
            publicity = widget.drink!.drinkData.publicity;
            underDevelopment = widget.drink!.drinkData.underDevelopment;
            favorite = widget.drink!.drinkData.favorite;
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(titleText()),
                actions: const [Hamburger()],
                backgroundColor: Colors.black87,
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 25.0,
                ),
                child: showSpinner ? loadingSpinner(context) : buildScrollbar(context),
            ),
            floatingActionButton: Builder(
                builder: (context) {
                    return FloatingActionButton(
                        onPressed: () { submitDrink(context); },
                        child: const Icon(Icons.check),
                    );
                }
            ),
        );
    }

    String titleText() => widget.drink != null ? 'Edit Drink' : 'Create Drink';

    EdgeInsetsGeometry formRowPadding() {
        return const EdgeInsets.only(bottom: 8.0);
    }

    Widget getSimpleField(String label, TextEditingController controller, {int numLines = 1, KeyName? key}) {
        return Padding(
            padding: formRowPadding(),
            child: TextField(
                key: key?.asKey(),
                controller: controller,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: label,
                ),
                maxLines: numLines,
            ),
        );
    }

    List<Widget> getIngredientsList() {
        List<Widget> list = [];
        list.add(Padding(
            padding: formRowPadding(),
            child: TextField(
                key: KeyName.addEditIngredientsInput.asKey(),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'New Ingredient',
                ),
                focusNode: newIngredientFocus,
                controller: newIngredientController,
                onSubmitted: (text)
                {
                    FocusScope.of(context).requestFocus(newIngredientFocus);
                    setState(() {
                        ingredients.add(text);
                        ingredientsControllers.add(TextEditingController(text: text));
                        ingredientsFocusNodes.add(FocusNode());
                        newIngredientController.clear();
                    });
                }
            ),
        ));
        list.add(const Text("Ingredients:"));
        for (var i = 0; i < ingredients.length; i++) {
            list.add(ListTile(
                key: Key(ingredients[i]),
                title: TextField(
                    focusNode: ingredientsFocusNodes[i],
                    controller: ingredientsControllers[i],
                    onChanged: (text)
                    {
                        ingredients[i] = text;
                    }
                ),
                trailing: 
                    IconButton(
                        onPressed: () 
                        {
                            setState(()
                            {
                                ingredients.removeAt(i);
                                ingredientsControllers.removeAt(i).dispose();
                                ingredientsFocusNodes.removeAt(i).dispose();
                            });
                        }, 
                        icon: const Icon(Icons.delete)
                    ),
                ),
            );
        }
        return list;
    }

    Widget booleanCheckbox(Function(bool) setFunc, bool Function() getFunc, String text) {
        return Row(
            children: [
                Checkbox(
                    value: getFunc(),
                    onChanged: (bool? value) {
                        setState(() {
                            setFunc(value!);
                        });
                    },
                ),
                Text(text),
            ],
        );
    }

    Widget getPublicityDropdown() {
        return Row(
            children: <Widget>[
                const Text("Publicity:"),
                const Spacer(),
                DropdownButton<DrinkPublicity>(
                    value: publicity ?? DrinkPublicity.DrinkPublicity_Public,
                    icon: const Icon(Icons.arrow_downward),
                    onChanged: (DrinkPublicity? newVal) {
                        setState(() {
                            publicity = newVal!;
                        });
                    },
                    items: <DrinkPublicity>[DrinkPublicity.DrinkPublicity_Public, DrinkPublicity.DrinkPublicity_Private].map<DropdownMenuItem<DrinkPublicity>>((DrinkPublicity val) {
                        var text = val.toString().replaceFirst("DrinkPublicity_", "");
                        return DropdownMenuItem<DrinkPublicity>(
                            value: val,
                            child: Text(text),
                        );
                    }).toList(),
                ),
            ],
        );
    }

    Widget buildScrollbar(BuildContext context) {
        List<Widget> components = [
            getSimpleField('Name', nameController, key: KeyName.addEditNameInput),
            getSimpleField('Primary Alcohol', primaryAlcoholController, key: KeyName.addEditPrimaryAlcoholInput),
            getSimpleField('Preferred Glass', preferredGlassController),
            getSimpleField('Instructions', instructionsController, numLines:2),
            getSimpleField('Notes', notesController, numLines:2),
        ];
        components.addAll(getIngredientsList());
        components.add(getPublicityDropdown());
        components.add(booleanCheckbox((v) { underDevelopment = v; }, () { return underDevelopment; }, "Under Development"));
        components.add(booleanCheckbox((v) { favorite = v; }, () { return favorite; }, "Favorite"));
        return Scrollbar(
            child: ListView.builder(
                itemCount: components.length,
                itemBuilder: (BuildContext context, int index) {
                    return components[index];
                },
            ),
        );
    }

    void submitDrink(BuildContext context) async {
        List<FormCheck> checks = [
            FormCheck(
                () => nameController.text.isNotEmpty,
                'Must have a name',
            ),
            FormCheck(
                () => primaryAlcoholController.text.isNotEmpty,
                'Must have a primary alcohol',
            ),
            FormCheck(
                () => ingredients.isNotEmpty,
                'Must have ingredients',
            ),

        ];

        bool allValid = true;
        for (int i = 0; i < checks.length; i++) {
            FormCheck check = checks[i];
            if (!check.func()) {
                allValid = false;
                showErrorSnackbar(context, check.message);
                break;
            }
        }

        if (allValid) {
            DrinkData dd = DrinkData(
                name: nameController.text,
                primaryAlcohol: primaryAlcoholController.text,
                ingredients: ingredients,
                publicity: publicity ?? DrinkPublicity.DrinkPublicity_Public,
                underDevelopment: underDevelopment,
                favorite: favorite,
            );
            if (preferredGlassController.text.isNotEmpty) {
                dd.preferredGlass = preferredGlassController.text;
            }
            if (instructionsController.text.isNotEmpty) {
                dd.instructions = instructionsController.text;
            }
            if (notesController.text.isNotEmpty) {
                dd.instructions = notesController.text;
            }

            setState(() {
                showSpinner = true;
            });

            var api = getIt<API>();
            if (widget.drink == null) {
                var resp = await api.createDrink(dd);
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
            } else {
                var resp = await api.updateDrink(id!, dd);
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
    }
}

class FormCheck {
    final Function func;
    final String message;

    FormCheck(this.func, this.message);
}
