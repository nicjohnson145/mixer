import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mixer/keys.dart';
import 'package:mixer/main.dart' as app;
import 'dart:developer';


//typedef OnObservation = void Function(Route<dynamic> route, Route<dynamic>? previousRoute);
//typedef OnReplace = void Function({Route<dynamic>? newRoute, Route<dynamic>? oldRoute});

//enum RouteAction {
//    push,
//    pop,
//    replace,
//}

//class TestNavigatorObserver extends NavigatorObserver {

//    OnObservation? onPush;
//    OnObservation? onPop;
//    OnReplace? onReplace;

//    @override
//    void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//        if (onPush != null) {
//            onPush!(route, previousRoute);
//        }
//    }

//    @override
//    void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
//        if (onPop != null) {
//            onPop!(route, previousRoute);
//        }
//    }

//    @override
//    void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
//        if (onReplace != null) {
//            onReplace!(newRoute: newRoute, oldRoute: oldRoute);
//        }
//    }

//    clear() {
//        onPush = null;
//        onPop = null;
//        onReplace = null;
//    }

//    attachPushRouteObserver(String expectedRouteName, Function pushCallback) {
//        onPush = (route, previousRoute) {
//          final isExpectedRoutePushed = route.settings.name == expectedRouteName;
//          // trigger callback if expected route is pushed
//          if(isExpectedRoutePushed) { pushCallback(); }
//        };
//    }

//    attachReplaceRouteObserver(String expectedRouteName, Function pushCallback) {
//        onReplace = ({newRoute, oldRoute}) {
//          final isExpectedRoutePushed = newRoute?.settings.name == expectedRouteName;
//          // trigger callback if expected route is pushed
//          if(isExpectedRoutePushed) { pushCallback(); }
//        };
//    }
//}

void main() {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    const createdDrinkName = "Integration Test Drink";
    const ingredientOne = "Integration Ingredient One";
    const ingredientTwo = "Integration Ingredient Two";

    Finder expectFindsOne(Finder f) {
        expect(f, findsOneWidget);
        return f;
    }

    Finder expectFindText(String s) {
        return expectFindsOne(find.text(s));
    }

    Finder expectFindKey(KeyName k) {
        return expectFindsOne(find.byKey(k.asKey()));
    }

    Finder expectFindFAB() {
        return expectFindsOne(find.byType(FloatingActionButton));
    }

    expectGoBack(tester) async {
        var btn = find.byTooltip("Back");
        expect(btn, findsOneWidget);
        await tester.tap(btn);
        await tester.pumpAndSettle();
    }

    login(tester) async {
        var usernameField = expectFindKey(KeyName.loginUsernameInput);
        await tester.enterText(usernameField, "foo");

        var passwordField = expectFindKey(KeyName.loginPasswordInput);
        await tester.enterText(passwordField, "foopass");

        var loginButton = expectFindKey(KeyName.loginLoginButton);
        await tester.tap(loginButton);
        await tester.pumpAndSettle();
    }

    _addIngredient(tester, ingredient) async {
        var ingredientField = expectFindKey(KeyName.addEditIngredientsInput);
        await tester.enterText(ingredientField, ingredient);
        await tester.testTextInput.receiveAction(TextInputAction.done);
    }

    createDrink(tester) async {
        var nameField = expectFindKey(KeyName.addEditNameInput);
        await tester.enterText(nameField, createdDrinkName);

        var primaryAlcoholField = expectFindKey(KeyName.addEditPrimaryAlcoholInput);
        await tester.enterText(primaryAlcoholField, "Integration Liquor");

        await _addIngredient(tester, ingredientOne);

        await tester.tap(expectFindFAB());
        await tester.pumpAndSettle();
    }

    navigateToIntegrationDrink(tester) async {
        var integrationDrink = find.text(createdDrinkName);
        expect(integrationDrink, findsOneWidget);
        await tester.tap(integrationDrink);
        await tester.pumpAndSettle();
    }

    updateDrink(tester) async {
        await navigateToIntegrationDrink(tester);

        var firstIngredient = find.text(ingredientOne);
        expect(firstIngredient, findsOneWidget);
        var seconedIngredient = find.text(ingredientTwo);
        expect(seconedIngredient, findsNothing);

        await tester.tap(expectFindFAB());
        await tester.pumpAndSettle();

        await _addIngredient(tester, ingredientTwo);

        await tester.tap(expectFindFAB());
        await tester.pumpAndSettle();

        await navigateToIntegrationDrink(tester);

        expect(firstIngredient, findsOneWidget);
        expect(seconedIngredient, findsOneWidget);

        await expectGoBack(tester);
    }

    copyOtherUsersDrink(tester) async {
        await tester.tap(expectFindKey(KeyName.hamburger));
        await tester.pumpAndSettle();
        await tester.tap(expectFindKey(KeyName.viewUserMenuItem));
        await tester.pumpAndSettle();
        await tester.tap(expectFindText("bar"));
        await tester.pumpAndSettle();
        await tester.tap(expectFindText("Jack Rose"));
        await tester.pumpAndSettle();

        // Open copy dialog
        await tester.tap(expectFindFAB());
        await tester.pumpAndSettle();

        // Copy Drink as is
        await tester.tap(expectFindKey(KeyName.copyDrinkOkButton));
        await tester.pumpAndSettle();

        // Until navigation works, just make sure we can find both the integration drink & the jack
        // rose, i.e that we're back on the home screen
        expectFindText(createdDrinkName);
        expectFindText("Jack Rose");
    }

    testWidgets("end to end test", (tester) async {
        app.main();
        await tester.pumpAndSettle();

        await login(tester);

        await tester.tap(expectFindFAB());
        await tester.pumpAndSettle();

        await createDrink(tester);

        await updateDrink(tester);
        await copyOtherUsersDrink(tester);
    });

}
