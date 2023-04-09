import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mixer/protos/drink.pb.dart';
import 'package:mixer/drink_filter.dart';
import 'package:fixnum/fixnum.dart';

void main() {
    List<Drink> drinkList() {
        return <Drink>[
            Drink(
                id: Int64(1),
                username: "foo",
                drinkData: DrinkData(
                    name: "Rum Normal",
                    primaryAlcohol: "Rum",
                    ingredients: ["ingredeint"],
                ),
            ),
            Drink(
                id: Int64(2),
                username: "foo",
                drinkData: DrinkData(
                    name: "Bourbon Normal",
                    primaryAlcohol: "Bourbon",
                    ingredients: ["ingredeint"],
                ),
            ),
            Drink(
                id: Int64(3),
                username: "foo",
                drinkData: DrinkData(
                    name: "Bourbon Favorite",
                    primaryAlcohol: "Bourbon",
                    ingredients: ["ingredeint"],
                    favorite: true,
                ),
            ),
            Drink(
                id: Int64(4),
                username: "foo",
                drinkData: DrinkData(
                    name: "Rum Development",
                    primaryAlcohol: "Rum",
                    ingredients: ["ingredeint"],
                    underDevelopment: true,
                ),
            ),
            Drink(
                id: Int64(5),
                username: "foo",
                drinkData: DrinkData(
                    name: "Rum Favorite",
                    primaryAlcohol: "Rum",
                    ingredients: ["ingredeint"],
                    favorite: true,
                ),
            ),
        ];
    }

    List<String> names(List<Drink> drinks) {
        return drinks.map((d) => d.drinkData.name).toList();
    }

    bool alwaysTrue(Drink d) {
        return true;
    }

    void executeTest(WidgetTester tester, Function(WidgetTester) actions, List<String> expected) async {
        var filterFunc = alwaysTrue;

        Widget testWidget = MaterialApp(
            home: DrinkFilterScreen(
                drinks: drinkList(),
                setFilter: (bool Function(Drink) newFunc) {
                    filterFunc = newFunc;
                },
            ),
        );
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        await actions(tester);

        var fab = find.byType(FloatingActionButton);
        expect(fab, findsOneWidget);
        await tester.tap(fab);
        await tester.pumpAndSettle();

        var drinks = drinkList();
        drinks.retainWhere(filterFunc);
        var outDrinks = names(drinks);
        expect(outDrinks, expected);
    }

    testWidgets('No checks, no filter', (tester) async {
        executeTest(tester, (_) {
            // Do nothing
        }, ["Rum Normal", "Bourbon Normal", "Bourbon Favorite", "Rum Development", "Rum Favorite"]);
    });

    testWidgets('Filter by alcohol', (tester) async {
        executeTest(
            tester,
            (t) async {
                var rum = find.byKey(const Key("alcohol_toggle_Rum"));
                expect(rum, findsOneWidget);
                await tester.tap(rum);
                await tester.pumpAndSettle();
            },
            ["Rum Normal", "Rum Development", "Rum Favorite"],
        );
    });

    testWidgets('Filter development', (tester) async {
        executeTest(
            tester,
            (t) async {
                var development = find.byKey(const Key("in_development"));
                expect(development, findsOneWidget);
                await tester.tap(development);
                await tester.pumpAndSettle();
            },
            ["Rum Development"],
        );
    });

    testWidgets('Filter by favorite', (tester) async {
        executeTest(
            tester,
            (t) async {
                var favorite = find.byKey(const Key("favorite"));
                expect(favorite, findsOneWidget);
                await tester.tap(favorite);
                await tester.pumpAndSettle();
            },
            ["Bourbon Favorite", "Rum Favorite"],
        );
    });

    testWidgets('Filter by alcohol and favorite', (tester) async {
        executeTest(
            tester,
            (t) async {
                var development = find.byKey(const Key("favorite"));
                expect(development, findsOneWidget);
                await tester.tap(development);
                await tester.pumpAndSettle();

                var bourbon = find.byKey(const Key("alcohol_toggle_Bourbon"));
                expect(bourbon, findsOneWidget);
                await tester.tap(bourbon);
                await tester.pumpAndSettle();
            },
            ["Bourbon Favorite"],
        );
    });
}
