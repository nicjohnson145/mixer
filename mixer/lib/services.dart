import 'package:get_it/get_it.dart';
import 'package:mixer/user_storage.dart';
import 'package:mixer/api.dart';
import 'package:http/http.dart' as http;


final getIt = GetIt.instance;

registerServices() {
    getIt.registerLazySingleton<Storage>(() => SecureStorage());
    getIt.registerLazySingleton<API>(() => HTTPAPI(client: http.Client()));
}
