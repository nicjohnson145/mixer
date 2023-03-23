# mixer

Unified client &amp; server repo for Mixer

This is a unification and rewrite of [mixer_remote](https://github.com/nicjohnson145/mixer-remote) and
[mixer-service](https://github.com/nicjohnson145/mixer-service). I wasn't proud of the backend, and
we were on a _very_ old version of flutter. There were no tests on the frontend. So I tried again. For
the third time.

## Flutter Bits

```
❯ flutter --version
Flutter 3.7.6 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 12cb4eb7a0 (31 hours ago) • 2023-03-01 10:29:26 -0800
Engine • revision ada363ee93
Tools • Dart 2.19.3 • DevTools 2.20.1
```

## Running Locally

You'll need:

* [task](https://taskfile.dev/installation/)
* docker-compose

If you just want to run the backend, so the frontend has something to talk to

```
cd mixerserver
task compose
```

If you want to run the backend locally to have a faster backend feedback loop

```
cd mixerserver
task compose-supporting
task local # starts the GRPC server locally
# Open a new terminal/tab/whatever
task local-gateway # starts the HTTP gateway
```

Once the backend is up and running in some fashion, launch the app with

```
flutter emulator --launch <your-device-id>
cd mixer
flutter run
```
