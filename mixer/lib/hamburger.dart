import 'package:flutter/material.dart';
import 'package:mixer/services.dart';
import 'package:mixer/user_storage.dart';
import 'package:mixer/change_password.dart';
import 'package:mixer/routes.dart';
import 'package:mixer/keys.dart';

enum HamburgerAction {
    logout,
    viewOtherUser,
    changePassword,
    //settings,
}

Hamburger newHamburger() {
    return Hamburger(key: KeyName.hamburger.asKey());
}

class Hamburger extends StatelessWidget {

    const Hamburger({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return PopupMenuButton<HamburgerAction>(
            itemBuilder: (BuildContext context) {
                return <PopupMenuItem<HamburgerAction>>[
                    const PopupMenuItem<HamburgerAction>(
                        value: HamburgerAction.logout,
                        child: Text("Logout"),
                    ),
                    PopupMenuItem<HamburgerAction>(
                        key: KeyName.viewUserMenuItem.asKey(),
                        value: HamburgerAction.viewOtherUser,
                        child: const Text("View Other User"),
                    ),
                    const PopupMenuItem<HamburgerAction>(
                        value: HamburgerAction.changePassword,
                        child: Text("Change Password"),
                    ),
                    //const PopupMenuItem<HamburgerAction>(
                    //    value: HamburgerAction.settings,
                    //    child: Text("Settings"),
                    //),
                ];
            },
            onSelected: (HamburgerAction action) async {
                switch (action) {
                    case HamburgerAction.logout:
                        var storage = getIt<Storage>();
                        await storage.clear();
                        Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false);
                        break;
                    case HamburgerAction.viewOtherUser:
                        Navigator.of(context).pushNamed(Routes.userList);
                        break;
                    case HamburgerAction.changePassword:
                        Navigator.of(context).pushNamed(Routes.changePassword);
                        break;
                    //case HamburgerAction.settings:
                    //    Navigator.of(context).pushNamed(Routes.Settings);
                    //    break;
                }
            },
        );
    }
}
