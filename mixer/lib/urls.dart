import 'package:flutter/foundation.dart' as Foundation;
import 'dart:io' show Platform;
import 'package:fixnum/fixnum.dart';

class Urls {
    static const String liveBaseURL = "https://mixer.nicjohnson.info";
    static final String localBaseURL = Platform.isIOS ? "http://127.0.0.1:8080" : "http://10.0.2.2:8080";
    static final String base = Foundation.kReleaseMode ? liveBaseURL : localBaseURL;
    static final String apiv1 = base + "/api/v1";

    static String login() {
        return apiv1 + "/login";
    }

    static String refresh() {
        return apiv1 + "/refresh";
    }

    static String listByUser(String username) {
        return apiv1 + "/drink/user/" + username;
    }

    static String create() {
        return apiv1 + "/drink";
    }

    static String update() {
        return apiv1 + "/drink";
    }

    static String delete(Int64 id) {
        return apiv1 + "/drink/" + id.toString();
    }
}
