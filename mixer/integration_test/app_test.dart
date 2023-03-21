import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mixer/keys.dart';
import 'package:mixer/main.dart' as app;

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

    Finder expectFindKey(KeyName k) {
        var f = find.byKey(k.asKey());
        expect(f, findsOneWidget);
        return f;
    }

    Finder expectFindFAB() {
        var fab = find.byType(FloatingActionButton);
        expect(fab, findsOneWidget);
        return fab;
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

    createDrink(tester) async {
        var nameField = expectFindKey(KeyName.addEditNameInput);
        await tester.enterText(nameField, createdDrinkName);

        var primaryAlcoholField = expectFindKey(KeyName.addEditPrimaryAlcoholInput);
        await tester.enterText(primaryAlcoholField, "Integration Liquor");

        var ingredientField = expectFindKey(KeyName.addEditIngredientsInput);
        await tester.enterText(ingredientField, "Integration Ingredient One");
        await tester.testTextInput.receiveAction(TextInputAction.done);

        await tester.tap(expectFindFAB());
        await tester.pumpAndSettle();
    }

    testWidgets("end to end test", (tester) async {
        app.main();
        await tester.pumpAndSettle();

        await login(tester);

        await tester.tap(expectFindFAB());
        await tester.pumpAndSettle();

        await createDrink(tester);

        expect(find.text(createdDrinkName), findsOneWidget);
    });

}
