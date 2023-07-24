import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_bloc/services/network_service.dart';


final GetIt locator = GetIt.instance;

void setupLocator() {
  /// network
  final dio = Dio();
  final networkService = DioService(dio: dio);

  locator.registerLazySingleton<Network>(() {
    networkService.configuration(Api.baseUrl);
    return networkService;
  });

}
