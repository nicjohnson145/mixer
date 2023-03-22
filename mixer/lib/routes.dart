import 'package:mixer/protos/drink.pb.dart';

class Routes {
    static const String login = "/login";
    static const String foopage = "/foo-page";
    static const String drinksByUser = "/drinks-by-user";
    static const String singleDrink = "/single-drink";
    static const String drinkAddEdit = "/drink-add-edit";
    static const String userList = "/user-list";
}

class SingleDrinkArgs {
    Drink drink;
    String username;

    SingleDrinkArgs({
        required this.drink,
        required this.username,
    });
}

class AddEditDrinkArgs {
    Drink? drink;

    AddEditDrinkArgs({
        this.drink,
    });
}
