import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final gt = GetIt.instance;

Future<void> init() async {
  gt.registerLazySingleton(() => http.Client());
}
