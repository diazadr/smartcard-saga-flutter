import 'package:get_it/get_it.dart';
import 'package:smartcard_saga/services/alert_service.dart';
import 'package:smartcard_saga/services/navigation_service.dart';
import 'package:smartcard_saga/services/rmq_service.dart';
import 'package:smartcard_saga/services/storage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AlertService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => RmqService());
  locator.registerLazySingleton(() => StorageService());
}