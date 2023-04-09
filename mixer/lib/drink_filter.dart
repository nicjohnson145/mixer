import 'package:flutter/material.dart';
import 'package:mixer/protos/drink.pb.dart';

class DrinkFilterScreen extends StatefulWidget {
    List<Drink> drinks;
    Function(bool Function(Drink)?) setFilter;

    DrinkFilterScreen({
        Key? key,
        required this.drinks,
        required this.setFilter,
    }) : super(key: key);

    @override
    _DrinkFilterScreenState createState() => _DrinkFilterScreenState();
}

class _DrinkFilterScreenState extends State<DrinkFilterScreen> {

    static const String inDevelopmentKey = "in_development";
    static const String favoriteKey = "favorite";

    Map<String, bool> alcoholToggles = {};
    Map<String, bool> statusToggles = {};

    @override
    void initState() {
        super.initState();
    }

    List<Widget> getAlcholCheckboxSection(List<Drink> drinks) {
        List<String> alcohols = [];
        drinks.forEach((d) {
            alcohols.add(d.drinkData.primaryAlcohol);
        });
        var deduped = alcohols.toSet().toList();
        deduped.sort();

        List<Widget> section = [
            const Padding(padding: EdgeInsets.only(top: 10.0)),
            const Text("Alcohol"),
        ];

        deduped.forEach((alcohol) {
            section.add(Row(
                children: <Widget>[
                    Checkbox(
                        key: Key("alcohol_toggle_$alcohol"),
                        value: alcoholToggles[alcohol] ?? false,
                        onChanged: (bool? val) => setState(() {
                            alcoholToggles[alcohol] = val!;
                        }),
                    ),
                    Text(alcohol),
                ],
            ));
        });

        return section;
    }

    List<Widget> getStatusCheckboxSection() {
        return <Widget>[
            const Padding(padding: EdgeInsets.only(top: 10.0)),
            const Text("Status"),
            Row(
                children: <Widget>[
                    Checkbox(
                        key: const Key(inDevelopmentKey),
                        value: statusToggles[inDevelopmentKey] ?? false,
                        onChanged: (bool? val) => setState(() {
                            statusToggles[inDevelopmentKey] = val!;
                        }),
                    ),
                    const Text("In Development"),
                ],
            ),
            Row(
                children: <Widget>[
                    Checkbox(
                        key: const Key(favoriteKey),
                        value: statusToggles[favoriteKey] ?? false,
                        onChanged: (bool? val) => setState(() {
                            statusToggles[favoriteKey] = val!;
                        }),
                    ),
                    const Text("Favorite"),
                ],
            ),
        ];
    }

    bool allOff(Map<dynamic, bool> m) {
        for (bool b in m.values) {
            if (b) {
                return false;
            }
        }
        return true;
    }

    void fabPressed() {
        var allAlcoholOff = allOff(alcoholToggles);
        var allStatusOff = allOff(statusToggles);

        if (allAlcoholOff && allStatusOff) {
            widget.setFilter(null);
            return;
        }

        widget.setFilter((d) {
            if (!allAlcoholOff) {
                if (!(alcoholToggles[d.drinkData.primaryAlcohol] ?? false)) {
                    return false;
                }
            }

            if (!allStatusOff) {
                if ((statusToggles[inDevelopmentKey] ?? false) && !d.drinkData.underDevelopment) {
                    return false;
                }
                if ((statusToggles[favoriteKey] ?? false) && !d.drinkData.favorite) {
                    return false;
                }
            }

            return true;
        });
    }

    @override
    Widget build(BuildContext context) {
        var widgets = [];
        widgets.addAll(getAlcholCheckboxSection(widget.drinks));
        widgets.addAll(getStatusCheckboxSection());

        return Scaffold(
            appBar: AppBar(
                title: const Text("Filter"),
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 25.0,
                ),
                child: Scrollbar(
                    child: ListView.builder(
                        itemCount: widgets.length,
                        itemBuilder: (BuildContext context, int index) {
                            return widgets[index];
                        },
                    ),
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: fabPressed,
                child: const Icon(Icons.check),
            ),
        );
    }
}
