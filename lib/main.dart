import 'package:darrebni/core/data/reposotories/shared_preferences_repository.dart';
import 'package:darrebni/core/services/language_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:darrebni/app/my_app.dart';
import 'package:darrebni/app/my_app_controller.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//SharedPreferences? globalSharedPreferenc;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });

  Get.put(SharedPreferencesRepository());

  await Get.put(LanguageService());

  Get.put(MyAppController());

  runApp(const MyApp());
}
