import 'package:flutter/material.dart';
import 'package:mixer/login.dart';
import 'package:mixer/user_storage.dart';
import 'package:mixer/api.dart';
import 'package:mixer/common.dart';
import 'package:mixer/routes.dart';
import 'package:mixer/user_drinks.dart';
import 'package:mixer/single_drink.dart';
import 'package:mixer/drink_add_edit.dart';
import 'package:mixer/services.dart';
import 'package:mixer/user_list.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:provider/provider.dart';
import 'package:mixer/user_change_notifier.dart';
import 'package:mixer/change_password.dart';
import 'package:mixer/drink_filter.dart';

void main() {
    mainWithObservers(null);
}

void mainWithObservers(NavigatorObserver? obs) {
    registerServices();
    runApp(
        ChangeNotifierProvider(
            create: (context) => UsernameProvider(),
            child: MyApp(observer: obs),
        ),
    );
}

class MyApp extends StatelessWidget {
    NavigatorObserver? observer;

    MyApp({
        super.key,
        this.observer,
    });

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
            ),
            navigatorObservers: observer == null ? [] : [observer!],
            home: FutureBuilder(
                future: rootFuture(),
                builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                        return loadingSpinner(context);
                    }

                    if (snapshot.hasError) {
                        return LoginPage();
                    }

                    final result = snapshot.data as Result<String, Exception>;
                    final page = result.when(
                        (username) {
                            Provider.of<UsernameProvider>(context, listen: false).set(username);
                            return UserDrinks(
                                username: username,
                            );
                        },
                        (error) {
                            return LoginPage();
                        }
                    );
                    return page;
                },
            ),
            onGenerateRoute: (settings) {
                switch (settings.name) {
                    case Routes.singleDrink : {
                        final args = settings.arguments as SingleDrinkArgs;
                        return MaterialPageRoute(
                            builder:  (context) {
                                return DrinkDetails(
                                    drink: args.drink,
                                );
                            },
                        );
                    }
                    case Routes.login : {
                        return MaterialPageRoute(builder: (_) => LoginPage());
                    }
                    case Routes.drinksByUser : {
                        return MaterialPageRoute(builder: (_) => UserDrinks());
                    }
                    case Routes.drinkAddEdit : {
                        final args = settings.arguments as AddEditDrinkArgs;
                        return MaterialPageRoute(
                            builder: (context) {
                                return DrinkAddEdit(
                                    drink: args.drink,
                                );
                            },
                        );
                    }
                    case Routes.userList : {
                        return MaterialPageRoute(builder: (_) => UserList());
                    }
                    case Routes.drinkFilter : {
                        final args = settings.arguments as DrinkFilterArgs;
                        return MaterialPageRoute(
                            builder: (_) => DrinkFilterScreen(
                                drinks: args.drinks,
                                setFilter: args.setFilter,
                            ),
                        );
                    }
                    case Routes.changePassword : {
                        return MaterialPageRoute(builder: (_) => ChangePassword());
                    }
                    default : {
                        assert(false, "Need to implement ${settings.name}");
                    }
                }
            },
        );
    }

    Future<Result<String, Exception>> rootFuture() async {
        var storage = getIt<Storage>();
        var loginInfo = await storage.getLogin();
        // If we didn't find anything
        if (loginInfo.username == "") {
            return Error(Exception("no data found"));
        }

        // We found some info, see if the refresh token is still good
        var api = getIt<API>();
        final refresh = await api.refresh();
        return refresh.when(
            (success) {
                return Success(loginInfo.username);
            },
            (error) {
                return Error(Exception("could not refresh"));
            }
        );
    }

}
