import 'package:flutter/material.dart';
import 'package:enum_to_string/enum_to_string.dart';

enum KeyName {
    loginUsernameInput,
    loginPasswordInput,
    loginLoginButton,

    addEditNameInput,
    addEditPrimaryAlcoholInput,
    addEditIngredientsInput,

    hamburger,
    viewUserMenuItem,

    copyDrinkOkButton,
}

extension KeyNameExtension on KeyName {
    Key asKey() {
        return Key(EnumToString.convertToString(this));
    }
}
