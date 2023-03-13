import 'package:flutter/foundation.dart' as Foundation;
import 'dart:io' show Platform;

class Urls {
    static const String liveBaseURL = "https://mixer.nicjohnson.info";
    static final String localBaseURL = Platform.isIOS ? "http://127.0.0.1:8080" : "http://10.0.2.2:8080";
    static final String base = Foundation.kReleaseMode ? liveBaseURL : localBaseURL;
    static final String apiv1 = base + "/api/v1";

    static final String login = apiv1 + "/login";
}
