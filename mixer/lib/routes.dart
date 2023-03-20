import 'package:mixer/protos/drink.pb.dart';

class Routes {
    static const String login = "/login";
    static const String foopage = "/foo-page";
    static const String drinksByUser = "/drinks-by-user";
    static const String singleDrink = "/single-drink";
}

class SingleDrinkArgs {
    Drink drink;

    SingleDrinkArgs({
        required this.drink,
    });
}
