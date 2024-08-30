import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../core/network/api_dio.dart';
import 'injector.dart';

final getIt = GetIt.I;

Future<void> initializeDependencies() async {
  PostsDependency.init();
  CustomInputDependency.init();

  getIt.registerLazySingleton<Dio>(() => AppDio.instance());
}
