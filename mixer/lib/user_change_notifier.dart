import 'package:flutter/foundation.dart';

class UsernameProvider extends ChangeNotifier {
    String? _username;

    void set(String s) {
        _username = s;
        notifyListeners();
    }

    String? get() {
        return _username;
    }
}
