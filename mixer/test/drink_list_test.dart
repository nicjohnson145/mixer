import 'package:flutter/material.dart';
import 'package:mixer/user_drinks.dart';
import 'package:mixer/user_storage.dart';
import 'package:mixer/services.dart';
import 'package:mixer/api.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mixer/protos/drink.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}
class MockAPI extends Mock implements API {}

void main() {
    setUpAll(() {
        registerServices();
        getIt.allowReassignment = true;
    });

    Widget create({required Widget child}) {
        return MediaQuery(
            data: const MediaQueryData(),
            child: MaterialApp(home: Scaffold(body: child)),
        );
    }

    testWidgets("user drinks smokes", (tester) async {
        const username = "foo_user";
        var d1ID = Int64(1);
        var d2ID = Int64(2);

        var mockStorage = MockStorage();
        when(() => mockStorage.getUsername()).thenAnswer((_) async {
            return username;
        });
        getIt.registerSingleton<Storage>(mockStorage);

        var mockAPI = MockAPI();
        when(() => mockAPI.listDrinksByUser(username)).thenAnswer((_) async {
            var d1 = Drink(
                id: d1ID,
                username: username,
                drinkData: DrinkData(
                    name: "Drink One",
                ),
            );
            var d2 = Drink(
                id: d2ID,
                username: username,
                drinkData: DrinkData(
                    name: "Drink Two",
                ),
            );
            return Success(ListDrinkResponse(drinks: [d1, d2]));
        });
        getIt.registerSingleton<API>(mockAPI);

        await tester.pumpWidget(create(child: UserDrinks()));
        await tester.pumpAndSettle();

        expect(find.text("Drink One"), findsOneWidget);
        expect(find.text("Drink Two"), findsOneWidget);
        verify(() => mockStorage.getUsername()).called(1);
        verify(() => mockAPI.listDrinksByUser(username)).called(1);
    });
}
