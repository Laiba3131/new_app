import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kulture/modules/settings/cubit/settings_cubit.dart';
import '../../modules/settings/cubit/push_notifications_cubit.dart';

import '../../config/environment.dart';
import '../storage_service/storage_service.dart';

final sl = GetIt.instance;

void setupLocator(Environment environment) async {
  /// ==================== Environment =========================
  sl.registerLazySingleton<Environment>(() => environment);

  /// ==================== Shared Pref =========================
  sl.registerSingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance());

  /// ==================== DataBase ===========================
  sl.registerSingletonWithDependencies<StorageService>(
    () => StorageService(sharedPreferences: sl()),
    dependsOn: [SharedPreferences],
  );

  /// ==================== Networking ===========================

  /// ==================== Modules ===========================

  /// ==================== Cubits ===========================
  sl.registerFactory(() => SettingsCubit(sl()));
  sl.registerLazySingleton(() => PushNotificationsCubit(sl()));
}
